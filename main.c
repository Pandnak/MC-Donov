/*
 * This example demonstrates how to configure control clock
 * and shows how much FLASH might deteriorate execution speed
 */

#include "stm32f0xx_ll_rcc.h"
#include "stm32f0xx_ll_system.h"
#include "stm32f0xx_ll_bus.h"
#include "stm32f0xx_ll_gpio.h"
#include "stm32f0xx_ll_tim.h"
#include "stdio.h"
#include "stdlib.h"
int round = 2; 
int boolean = 0; 
int gameRound = 0; // текущий раунд игры
int win = 0; // количетво побед
int difficulty = 150; //это кажись 1.5с 
int tim2 = 0;
int stop = 1; 

uint32_t time1 = 0, time2 = 0, timePrav1 = 0;  
int m = 0; 
int massTime[]= {0,0,0,0,0,0,0,0,0,0,0,0};
int index = 0;

int randMass[] = {200,200,200,200,200,200,0,0,0,0,0,0}; // рандомный массив
int GameMassUp[] = {300,300,300,300,300,300,0,0,0,0,0,0};// верхние пределы нажатия кнопки 
int GameMassDown[] = {100,100,100,100,100,100,0,0,0,0,0,0}; // нижние пределы нажатия кнопки 

int gameOn = 0; // включить игору: 0 - выкл, 1 - предпоказ, 2 - увидел надо начать, 3 - сама игра  

#define FLASH_0LAT_DELAY0LAT
//#define FLASH_0LAT_DELAY1LAT
//#define FLASH_1LAT_DELAY0LAT
//#define FLASH_1LAT_DELAY1LAT

/**
  * System Clock Configuration
  * The system Clock is configured as follow :
  *    System Clock source            = PLL (HSI/2)
  *    SYSCLK(Hz)                     = 48000000
  *    HCLK(Hz)                       = 48000000
  *    AHB Prescaler                  = 1
  *    APB1 Prescaler                 = 1
  *    HSI Frequency(Hz)              = 8000000
  *    PLLMUL                         = 12
  *    Flash Latency(WS)              = 1
  */
static void rcc_config()
{
    /* Set FLASH latency */
#if defined(FLASH_0LAT_DELAY0LAT) || defined(FLASH_0LAT_DELAY1LAT)
    LL_FLASH_SetLatency(LL_FLASH_LATENCY_0);
#else
    LL_FLASH_SetLatency(LL_FLASH_LATENCY_1);
#endif

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
    LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_11, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_6, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_7, LL_GPIO_MODE_OUTPUT);

	LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_10, LL_GPIO_MODE_OUTPUT);
    LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_9, LL_GPIO_MODE_OUTPUT);
     LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_8, LL_GPIO_MODE_OUTPUT);

    return;
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
	if (mass[3] == 1) LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_11);
	if (mass[4] == 1) LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_4);
	if (mass[5] == 1) LL_GPIO_SetOutputPin(GPIOC, LL_GPIO_PIN_1);
	if (mass[6] == 1) LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_7);
	
	if (mass[0] == 0) LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_0);
	if (mass[1] == 0) LL_GPIO_ResetOutputPin(GPIOC, LL_GPIO_PIN_2);
	if (mass[2] == 0) LL_GPIO_ResetOutputPin(GPIOA, LL_GPIO_PIN_6);
	if (mass[3] == 0) LL_GPIO_ResetOutputPin(GPIOA, LL_GPIO_PIN_11);
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
	num = num-(num/1000)*1000;
	delay();
	printSymb(num/100,3);
	num = num-(num/100)*100;
	delay();
	
	printSymb(num/10,2);
	num = num-(num/10)*10;
	delay();
	printSymb(num,1);
	delay();

	return;	
	
}

static void timers_config(void)
{
    /*
     * Configure input channel
     */
    LL_AHB1_GRP1_EnableClock(LL_AHB1_GRP1_PERIPH_GPIOA);
    LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_5, LL_GPIO_MODE_ALTERNATE);
    LL_GPIO_SetAFPin_0_7(GPIOA, LL_GPIO_PIN_5, LL_GPIO_AF_2);
    LL_GPIO_SetPinPull(GPIOA, LL_GPIO_PIN_5, LL_GPIO_PULL_UP);

    /*
     * Setup timer to capture input mode
     */
    LL_APB1_GRP1_EnableClock(LL_APB1_GRP1_PERIPH_TIM2);
    LL_TIM_SetPrescaler(TIM2, 47999);
    LL_TIM_IC_SetFilter(TIM2, LL_TIM_CHANNEL_CH1, LL_TIM_IC_FILTER_FDIV16_N5);
    LL_TIM_IC_SetPolarity(TIM2, LL_TIM_CHANNEL_CH1,
                           LL_TIM_IC_POLARITY_BOTHEDGE);
    LL_TIM_IC_SetActiveInput(TIM2, LL_TIM_CHANNEL_CH1,
                             LL_TIM_ACTIVEINPUT_DIRECTTI);
    LL_TIM_IC_SetPrescaler(TIM2, LL_TIM_CHANNEL_CH1, LL_TIM_ICPSC_DIV1);
    LL_TIM_CC_EnableChannel(TIM2, LL_TIM_CHANNEL_CH1);
    LL_TIM_GenerateEvent_UPDATE(TIM2); // reset timer to force it to our setting 
    LL_TIM_EnableIT_CC1(TIM2);
    LL_TIM_EnableCounter(TIM2);
    /*
     * Setup NVIC
     */
    NVIC_EnableIRQ(TIM2_IRQn);
    NVIC_SetPriority(TIM2_IRQn, 1);

	 LL_APB1_GRP1_EnableClock(LL_APB1_GRP1_PERIPH_TIM3);
    LL_TIM_SetPrescaler(TIM3, 47999);
    LL_TIM_SetAutoReload(TIM3, 99);
    LL_TIM_SetCounterMode(TIM3, LL_TIM_COUNTERMODE_UP);
    LL_TIM_EnableIT_UPDATE(TIM3);
    LL_TIM_EnableCounter(TIM3);
    /*
     * Setup NVIC
     */
    NVIC_EnableIRQ(TIM3_IRQn);
    NVIC_SetPriority(TIM3_IRQn, 0);
    return;
}
void Rand()
 {
	 LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_9);
	
	 
	  for (int i = 0; i < round; i++) 
	  {
			/*randMass[2*i] = rand()%300 + 200;
			GameMassUp[2*i] = randMass[2*i] + difficulty;
			GameMassDown[2*i] = randMass[2*i] - difficulty;
			randMass[2*i+1] = rand()%300 + 200;
			GameMassUp[2*i+1] = randMass[2*i-1] + difficulty;
			GameMassDown[2*i+1] = randMass[2*i-1] - difficulty;*/
	  }
	  int timeNow = tim2;

	  int flag =1;
	  int i = 0; 
	  LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_10);
	   while (flag == 1)
	   {
		  	izthif(m);

		   if (tim2 - timeNow > randMass[i] )
		   {
			   i++; 
			   LL_GPIO_TogglePin(GPIOA, LL_GPIO_PIN_10);
				timeNow = tim2; 
		   } 
		   
		   if (i == round*2) flag = 0; 
	   }
	   LL_GPIO_ResetOutputPin(GPIOA, LL_GPIO_PIN_9);
	   LL_GPIO_ResetOutputPin(GPIOA, LL_GPIO_PIN_10);

 }	
 void Rand2()
 {
	
	  int timeNow = tim2;
	  int flag =1;
	  LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_8);
	   while (flag == 1)
	   { 
		   	izthif(m);
		   if (tim2 - timeNow > 200)
		   {
				flag = 0;
		   }
	   }
	   LL_GPIO_ResetOutputPin(GPIOA, LL_GPIO_PIN_8);

 }	
  void Rand3()
 {
	
	  int timeNow = tim2;
	  int flag = 1;
	  LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_9);
	   while (flag == 1)
	   {
		   izthif(m);
		   if (tim2 - timeNow > 200)
		   {
				flag=0;
		   }
	   }
	   LL_GPIO_ResetOutputPin(GPIOA, LL_GPIO_PIN_9);

 }	



void TIM2_IRQHandler(void)
{
	stop = 1;
	izthif(m);
	switch (gameOn)
	{
		case 6: 
			if (LL_GPIO_IsInputPinSet(GPIOA, LL_GPIO_PIN_5))  
			{ 
				izthif(m);
				gameOn = 0;
			}
		break;
		case 0: 
			if (LL_GPIO_IsInputPinSet(GPIOA, LL_GPIO_PIN_5))  
			{ 
				izthif(m);
				gameOn = 2;
				Rand();
			}
		break; 
		case 2: 
			if (!LL_GPIO_IsInputPinSet(GPIOA, LL_GPIO_PIN_5) ) 
			{
				izthif(m);
				 time1 = LL_TIM_IC_GetCaptureCH1(TIM2);
				 LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_10);
				 gameOn = 3;
				 gameRound = 1; 
			}
		break; 
		case 3: 
				if (!LL_GPIO_IsInputPinSet(GPIOA, LL_GPIO_PIN_5) ) 
				{
					izthif(m);
					LL_GPIO_SetOutputPin(GPIOA, LL_GPIO_PIN_10);
				}	
				if (LL_GPIO_IsInputPinSet(GPIOA, LL_GPIO_PIN_5))
				{
					izthif(m);
					LL_GPIO_ResetOutputPin(GPIOA, LL_GPIO_PIN_10);
				}
					if (((LL_TIM_IC_GetCaptureCH1(TIM2)-time1)/10 < GameMassDown[gameRound] )) 
					{
						izthif(m);
						Rand2();
						m = m +100;
						gameOn=6;
						LL_GPIO_ResetOutputPin(GPIOA, LL_GPIO_PIN_10);
						stop = 0;

					}
					if (((LL_TIM_IC_GetCaptureCH1(TIM2)-time1) /10 > GameMassUp[gameRound])) 
					{
						izthif(m);
						m = m + 100;
						gameOn=6;				
						Rand2();
						stop = 0;
						LL_GPIO_ResetOutputPin(GPIOA, LL_GPIO_PIN_10);
					}
					time1 = LL_TIM_IC_GetCaptureCH1(TIM2);

					gameRound++; 
					if (gameRound == round*2 && stop!=0) 
					{
						izthif(m);
						m = m+1;
						Rand2();
						gameOn = 6;
						LL_GPIO_ResetOutputPin(GPIOA, LL_GPIO_PIN_10);
					}
		break; 


	}
	izthif(m);
    LL_GPIO_TogglePin(GPIOC, LL_GPIO_PIN_8);
    LL_TIM_ClearFlag_CC1(TIM2);
	//m = gameOn;

}

/*
 * Here we call configure all peripherals we need and
 * start blinking upon current mode
 */


void TIM3_IRQHandler(void)
{

    tim2 = tim2 + 10;

   
    LL_TIM_ClearFlag_UPDATE(TIM3);
}

 int cnop()
 {
 	int count = 0; 
 	

 	for (int i = 0; i < 50; i++)
 	{
 		delay();
 		if (LL_GPIO_IsInputPinSet(GPIOA, LL_GPIO_PIN_0)) count++;
 	}
 	if (count > 30) return 1;
 	return 0; 
 	
 }

int main(void)
{
    rcc_config();
    gpio_config();
    int flag = 1;
	timers_config();
	
    LL_GPIO_SetPinMode(GPIOA, LL_GPIO_PIN_0, LL_GPIO_MODE_INPUT);
    while (1) {
	
		
		int status = LL_GPIO_IsInputPinSet(GPIOA, LL_GPIO_PIN_0);
		if (status == 0)  flag =1; 
		izthif(m);
		if (status && flag) { 
		if (cnop(m)) m++;
		flag = 0; 
		}
		
	

    }
    return 0;
}
