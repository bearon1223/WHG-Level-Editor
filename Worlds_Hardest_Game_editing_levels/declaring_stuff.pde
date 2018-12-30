int arraySize = 1000;

float[] removecubex  = new float[arraySize];
float[] removecubey  = new float[arraySize];

float[] checkpointx  = new float[arraySize];
float[] checkpointy  = new float[arraySize];
float[] checkpointx2 = new float[arraySize];
float[] checkpointy2 = new float[arraySize];

float[] endx  = new float[arraySize];
float[] endy  = new float[arraySize];
float[] endx2 = new float[arraySize];
float[] endy2 = new float[arraySize];

float[] linex  = new float[arraySize];
float[] liney  = new float[arraySize];
float[] linex2 = new float[arraySize];
float[] liney2 = new float[arraySize];

float[] removecube2x  = new float[arraySize];
float[] removecube2y  = new float[arraySize];
float[] removecube2x2 = new float[arraySize];
float[] removecube2y2 = new float[arraySize];

float[] enemyx  = new float[19];
float[] enemyy  = new float[19];
float[] enemyx2 = new float[19];

float[] enemyxi  = new float[19];
float[] enemyyi  = new float[19];
float[] enemyxi2 = new float[19];

float[] enemyxu  = new float[19];
float[] enemyyu  = new float[19];
float[] enemyyu2 = new float[19];

float[] enemyxui  = new float[19];
float[] enemyyui  = new float[19];
float[] enemyyui2 = new float[19];

float[] enemyrx  = new float[19];
float[] enemyry  = new float[19];
float[] enemyry2 = new float[19];
float[] enemyrsp = new float[19];

enemys e  = new enemys(0, 0, 0, false);
enemys e1 = new enemys(0, 0, 0, false);
enemys e2 = new enemys(0, 0, 0, false);
enemys e3 = new enemys(0, 0, 0, false);
enemys e4 = new enemys(0, 0, 0, false);
enemys e5 = new enemys(0, 0, 0, false);
enemys e6 = new enemys(0, 0, 0, false);
enemys e7 = new enemys(0, 0, 0, false);
enemys e8 = new enemys(0, 0, 0, false);
enemys e9 = new enemys(0, 0, 0, false);
enemys e10 = new enemys(0, 0, 0, false);
enemys e11 = new enemys(0, 0, 0, false);
enemys e12 = new enemys(0, 0, 0, false);
enemys e13 = new enemys(0, 0, 0, false);
enemys e14 = new enemys(0, 0, 0, false);
enemys e15 = new enemys(0, 0, 0, false);
enemys e16 = new enemys(0, 0, 0, false);
enemys e17 = new enemys(0, 0, 0, false);
enemys e18 = new enemys(0, 0, 0, false);
enemys e19 = new enemys(0, 0, 0, false);
enemys e20 = new enemys(0, 0, 0, false);

enemys ei  = new enemys(0, 0, 0, false);
enemys ei1 = new enemys(0, 0, 0, false);
enemys ei2 = new enemys(0, 0, 0, false);
enemys ei3 = new enemys(0, 0, 0, false);
enemys ei4 = new enemys(0, 0, 0, false);
enemys ei5 = new enemys(0, 0, 0, false);
enemys ei6 = new enemys(0, 0, 0, false);
enemys ei7 = new enemys(0, 0, 0, false);
enemys ei8 = new enemys(0, 0, 0, false);
enemys ei9 = new enemys(0, 0, 0, false);
enemys ei10 = new enemys(0, 0, 0, false);
enemys ei11 = new enemys(0, 0, 0, false);
enemys ei12 = new enemys(0, 0, 0, false);
enemys ei13 = new enemys(0, 0, 0, false);
enemys ei14 = new enemys(0, 0, 0, false);
enemys ei15 = new enemys(0, 0, 0, false);
enemys ei16 = new enemys(0, 0, 0, false);
enemys ei17 = new enemys(0, 0, 0, false);
enemys ei18 = new enemys(0, 0, 0, false);
enemys ei19 = new enemys(0, 0, 0, false);
enemys ei20 = new enemys(0, 0, 0, false);

enemyu eu = new enemyu(0, 0, 0, false);
enemyu eu1 = new enemyu(0, 0, 0, false);
enemyu eu2 = new enemyu(0, 0, 0, false);
enemyu eu3 = new enemyu(0, 0, 0, false);
enemyu eu4 = new enemyu(0, 0, 0, false);
enemyu eu5 = new enemyu(0, 0, 0, false);
enemyu eu6 = new enemyu(0, 0, 0, false);
enemyu eu7 = new enemyu(0, 0, 0, false);
enemyu eu8 = new enemyu(0, 0, 0, false);
enemyu eu9 = new enemyu(0, 0, 0, false);
enemyu eu10 = new enemyu(0, 0, 0, false);
enemyu eu11 = new enemyu(0, 0, 0, false);
enemyu eu12 = new enemyu(0, 0, 0, false);
enemyu eu13 = new enemyu(0, 0, 0, false);
enemyu eu14 = new enemyu(0, 0, 0, false);
enemyu eu15 = new enemyu(0, 0, 0, false);
enemyu eu16 = new enemyu(0, 0, 0, false);
enemyu eu17 = new enemyu(0, 0, 0, false);
enemyu eu18 = new enemyu(0, 0, 0, false);
enemyu eu19 = new enemyu(0, 0, 0, false);

enemyu eui = new enemyu(0, 0, 0, false);
enemyu eui1 = new enemyu(0, 0, 0, false);
enemyu eui2 = new enemyu(0, 0, 0, false);
enemyu eui3 = new enemyu(0, 0, 0, false);
enemyu eui4 = new enemyu(0, 0, 0, false);
enemyu eui5 = new enemyu(0, 0, 0, false);
enemyu eui6 = new enemyu(0, 0, 0, false);
enemyu eui7 = new enemyu(0, 0, 0, false);
enemyu eui8 = new enemyu(0, 0, 0, false);
enemyu eui9 = new enemyu(0, 0, 0, false);
enemyu eui10 = new enemyu(0, 0, 0, false);
enemyu eui11 = new enemyu(0, 0, 0, false);
enemyu eui12 = new enemyu(0, 0, 0, false);
enemyu eui13 = new enemyu(0, 0, 0, false);
enemyu eui14 = new enemyu(0, 0, 0, false);
enemyu eui15 = new enemyu(0, 0, 0, false);
enemyu eui16 = new enemyu(0, 0, 0, false);
enemyu eui17 = new enemyu(0, 0, 0, false);
enemyu eui18 = new enemyu(0, 0, 0, false);
enemyu eui19 = new enemyu(0, 0, 0, false);

rotatingEnemys er  = new rotatingEnemys(0, 0, 0, 0, true);
rotatingEnemys er1 = new rotatingEnemys(0, 0, 0, 0, true);
rotatingEnemys er2 = new rotatingEnemys(0, 0, 0, 0, true);
rotatingEnemys er3 = new rotatingEnemys(0, 0, 0, 0, true);
rotatingEnemys er4 = new rotatingEnemys(0, 0, 0, 0, true);
rotatingEnemys er5 = new rotatingEnemys(0, 0, 0, 0, true);
rotatingEnemys er6 = new rotatingEnemys(0, 0, 0, 0, true);
rotatingEnemys er7 = new rotatingEnemys(0, 0, 0, 0, true);
rotatingEnemys er8 = new rotatingEnemys(0, 0, 0, 0, true);
rotatingEnemys er9 = new rotatingEnemys(0, 0, 0, 0, true);
rotatingEnemys er10 = new rotatingEnemys(0, 0, 0, 0, true);
rotatingEnemys er11 = new rotatingEnemys(0, 0, 0, 0, true);
rotatingEnemys er12 = new rotatingEnemys(0, 0, 0, 0, true);
rotatingEnemys er13 = new rotatingEnemys(0, 0, 0, 0, true);
rotatingEnemys er14 = new rotatingEnemys(0, 0, 0, 0, true);
rotatingEnemys er15 = new rotatingEnemys(0, 0, 0, 0, true);
rotatingEnemys er16 = new rotatingEnemys(0, 0, 0, 0, true);
rotatingEnemys er17 = new rotatingEnemys(0, 0, 0, 0, true);
rotatingEnemys er18 = new rotatingEnemys(0, 0, 0, 0, true);
rotatingEnemys er19 = new rotatingEnemys(0, 0, 0, 0, true);
