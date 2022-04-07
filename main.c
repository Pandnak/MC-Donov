/*
 * This example demonstrates how to configure control clock
 * and shows how much FLASH might deteriorate execution speed
 */

#include "stm32f0xx_ll_rcc.h"
#include "stm32f0xx_ll_system.h"
#include "stm32f0xx_ll_bus.h"
#include "stm32f0xx_ll_gpio.h"
#include "stm32f0xx_ll_tim.h"
#include "stm32f0xx_ll_exti.h"
#include "stm32f0xx_ll_utils.h"
#include "stm32f0xx_ll_cortex.h"
#include "stdio.h"
#include "stdlib.h"


#define FLASH_0LAT_DELAY0LAT

int m = 1234;




static void rcc_config()
{
 
    /* Set FLASH latency */
    LL_FLASH_SetLatency(LL_FLASH_LATENCY_1);

    /* Enable HSI and wait for activation*/
    LL_RCC_HSI_Enable();
    while (LL_RCC_HSI_IsReady() != 1);

    /* Main PLL configuration and activation */
    LL_RCC_PLL_ConfigDomain_SYS(LL_RCC_PLLSOURCE_HSI_DIV_2,
                                LL_RCC_PLL_MUL_12);

    LL_RCC_PLL_Enable();
    while (LL_RCC_PLL_IsReady() != 1);

    /* Sysclk activation on the main PLL */
    LL_RCC_SetAHBPrescaler(LL_RCC_SYSCLK_DIV_1);
    LL_RCC_SetSysClkSource(LL_RCC_SYS_CLKSOURCE_PLL);
    while (LL_RCC_GetSysClkSource() != LL_RCC_SYS_CLKSOURCE_STATUS_PLL);

    /* Set APB1 prescaler */
    LL_RCC_SetAPB1Prescaler(LL_RCC_APB1_DIV_1);

    /* Update CMSIS variable (which can be updated also
     * through SystemCoreClockUpdate function) */
    SystemCoreClock = 48000000;

}

/*
 * Clock on GPIOC and set pin with Blue led connected
 */
static void gpio_config(void)
{
    LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOC);
    LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOA);
    
    LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_0, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_1, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_2, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOC, LL_GPIO_PIN_3, LL_GPIO_MODE_OUTPUT);
    
    LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_0, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_1, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_2, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_3, LL_GPIO_MODE_OUTPUT);
    
    LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_4, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_5, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_6, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_7, LL_GPIO_MODE_OUTPUT);
    
    LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_8, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_9, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_10, LL_GPIO_MODE_OUTPUT);

	LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_0, LL_GPIO_MODE_INPUT);
    
	LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOC);
    return;
}

static void exti_config(void)
{
    LL_APB1_GRP2_EnableClock(LL_APB1_GRP2_PERIPH_SYSCFG);

    LL_SYSCFG_SetEXTISource(LL_SYSCFG_EXTI_PORTA, LL_SYSCFG_EXTI_LINE0);

    LL_EXTI_EnableIT_0_31(LL_EXTI_LINE_0);

    LL_EXTI_EnableRisingTrig_0_31(LL_EXTI_LINE_0);

    /*
     * Setting interrupts
     */
    NVIC_EnableIRQ(EXTI0_1_IRQn);
    NVIC_SetPriority(EXTI0_1_IRQn, 0);
}

static void timers_config(void)
{
    /*
     * Setup timer
     */
    LL_APB1_GRP1_EnableClock(LL_APB1_GRP1_PERIPH_TIM2);
    LL_TIM_SetPrescaler(TIM2, 47999);
    LL_TIM_SetAutoReload(TIM2, 999);
    LL_TIM_SetCounterMode(TIM2, LL_TIM_COUNTERMODE_UP);
    LL_TIM_EnableIT_UPDATE(TIM2);
    LL_TIM_EnableCounter(TIM2);
    /*
     * Setup NVIC
     */
    NVIC_EnableIRQ(TIM2_IRQn);
    NVIC_SetPriority(TIM2_IRQn, 0);
    return;
}
void TIM2_IRQHandler(void)
{

	m += 1;
    LL_TIM_ClearFlag_UPDATE(TIM2);
}

void EXTI0_1_IRQHandler(void)
{
   
	m++;

	LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_8);

    LL_EXTI_ClearFlag_0_31(LL_EXTI_LINE_0);
}

/*
 * Just set of commands to waste CPU power for a second
 * (basically it is a simple cycle with a predefined number
 * of loops)
 */
__attribute__((naked)) static void delay(void)
{
    asm ("push {r7, lr}");
    asm ("ldr r6, [pc, #8]");
    asm ("sub r6, #1");
    asm ("cmp r6, #0");
    asm ("bne delay+0x4");
    asm ("pop {r7, pc}");
#if defined(FLASH_0LAT_DELAY0LAT) || defined(FLASH_1LAT_DELAY0LAT)
    asm (".word 0x001000"); //9600000
#else
    asm (".word 0x5b8d80"); //6000000
#endif
}
void fkl (int mass[7])
{
	
	if (mass[0] == 1) LL_GPIO_SetOutputPin(GPIOC, LL_GPIO_PIN_0);
	if (mass[1] == 1) LL_GPIO_SetOutputPin(GPIOC, LL_GPIO_PIN_2);
	if (mass[2] == 1) LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_6);
	if (mass[3] == 1) LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_5);
	if (mass[4] == 1) LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_4);
	if (mass[5] == 1) LL_GPIO_SetOutputPin(GPIOC, LL_GPIO_PIN_1);
	if (mass[6] == 1) LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_7);
	
	if (mass[0] == 0) LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_0);
	if (mass[1] == 0) LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_2);
	if (mass[2] == 0) LL_GPIO_ResetOutputPin(GPIOA, LL_GPIO_PIN_6);
	if (mass[3] == 0) LL_GPIO_ResetOutputPin(GPIOA, LL_GPIO_PIN_5);
	if (mass[4] == 0) LL_GPIO_ResetOutputPin(GPIOA, LL_GPIO_PIN_4);
	if (mass[5] == 0) LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_1);
	if (mass[6] == 0) LL_GPIO_ResetOutputPin(GPIOA, LL_GPIO_PIN_7);
	
	
}

void printSymb(int symb, int reg)
{
int m[7];
	switch (reg) {
	    case 1:
		LL_GPIO_ResetOutputPin(GPIOA, LL_GPIO_PIN_3);
		LL_GPIO_SetOutputPin(GPIOC, LL_GPIO_PIN_3);
		LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_2);
		LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_1);
		break;
	    case 2:
		LL_GPIO_ResetOutputPin(GPIOA, LL_GPIO_PIN_2);
		LL_GPIO_SetOutputPin(GPIOC, LL_GPIO_PIN_3);
		LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_1);
		LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_3);
		break;
	    case 3:
		LL_GPIO_ResetOutputPin(GPIOA, LL_GPIO_PIN_1);
		LL_GPIO_SetOutputPin(GPIOC, LL_GPIO_PIN_3);
		LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_2);
		LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_3);
		break;
	    case 4:
	    	LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_3);
	    	LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_1);
		LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_2);
		LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_3);
		break;
	    default:
        break;
    	}
    	switch (symb) {
	    case 0:
		m[0]=1; m[1]=1; m[2]=1; m[3]=1; m[4]=1; m[5]=1; m[6]=0; 	
		fkl(m);	
		break;
	   case 1:
		m[0]=0; m[1]=1; m[2]=1; m[3]=0; m[4]=0; m[5]=0; m[6]=0;
		fkl(m);
		break;
	   case 2:
	    	m[0]=1; m[1]=1; m[2]=0; m[3]=1; m[4]=1; m[5]=0; m[6]=1;
		fkl(m);
		break;
 	   case 3:
	    	m[0]=1; m[1]=1; m[2]=1; m[3]=1; m[4]=0; m[5]=0; m[6]=1;
		fkl(m);
		break;
	   case 4:
		m[0]=0; m[1]=1; m[2]=1; m[3]=0; m[4]=0; m[5]=1; m[6]=1; 	
		fkl(m);	
		break;
	   case 5:
		m[0]=1; m[1]=0; m[2]=1; m[3]=1; m[4]=0; m[5]=1; m[6]=1;
		fkl(m);
		break;
	   case 6:
	    	m[0]=1; m[1]=0; m[2]=1; m[3]=1; m[4]=1; m[5]=1; m[6]=1;
		fkl(m);
		break;
 	   case 7:
	    	m[0]=1; m[1]=1; m[2]=1; m[3]=0; m[4]=0; m[5]=0; m[6]=0;
		fkl(m);
		break;
	   case 8:
	    	m[0]=1; m[1]=1; m[2]=1; m[3]=1; m[4]=1; m[5]=1; m[6]=1;
		fkl(m);
		break;
	   case 9:
	    	m[0]=1; m[1]=1; m[2]=1; m[3]=1; m[4]=0; m[5]=1; m[6]=1;
		fkl(m);
		break;
	    default:
        break;
    }
	return;
}

void izthif( int num)
{
	
	printSymb(num/1000,4);
	num = num % 1000;
	delay();
	printSymb(num/100,3);
	num = num % 100;
	delay();
	
	printSymb(num/10,2);
	num = num % 10;
	delay();
	printSymb(num,1);
	delay();

	return;	
	
}

void dec_to_bin(int num, int* s[9])
{
     int v = 256;
     for(int i = 0; i <= 8; i++)
     {
             if(num >= v)
             {
                    *s[8 - i] = 1;
                    num -= v;
             }
             else
                 *s[8- i] = 0;

             v /= 2;
     }
}

void gen_sequence()
{
	//int s[9];
	int num = rand() % 1024;
	izthif(num);
	for (int i = 0; i < 1000; ++i)
		delay();
	//dec_to_bin(num, &s);
	//for (int i = 0; i <= 8; ++i)
	//	printf("%d", s[i]);
}


int main(void)
{
    rcc_config(); //настройка тактирования
    gpio_config(); //настройка выводов
    exti_config(); //настройка прерываний
    timers_config(); //настройка таймеров
    
    //вывод числа m на семисегментник
    while (1) {	
		//izthif(m);
		gen_sequence();
    }
    return 0;
}
