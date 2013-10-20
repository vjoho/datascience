color[] table = {#FF2603, #FF6A01, #FFA62E, #757E00, #292B06, #333333, #333333};
color [] pallette = table;
PImage textBlock;  // Two images to load

PFont titleFont, paragraph, subtitleFont;

String[] YearStat = { 
  "Smartphone", "Tablet", "Laptop", "M2M Module"
};

Float[] populationPerc= {
  85.21, 70.72, 103.9, 134.2, 155.5, 109.28
};

String[] CountryBars= {
  "China", "India", "USA", "Brazil", "Russia", "Indonesia"
};

int[] mobileNum= {
  1150000000, 867800000, 327577529, 265741000, 256116000, 236800000
};

int[] PopNum= {
  1349585838, 1220800359, 310866000, 192379287, 142905200, 237556363
};
//multi dimentional array
float[][] allData = {
  {
    20, 46, 11, 36
  }
  , 
  {
    5.9, 1.6, 2.8, 4.7, 7.4, 11.2
  }
};

float[]  chosenData = allData[0];

void setup() {

  size(1200, 750);
  titleFont = loadFont("HelveticaCY-Bold-30.vlw");
  paragraph = loadFont("HelveticaNeue-14.vlw");
  subtitleFont =  loadFont("HelveticaNeue-Medium-18.vlw");
  smooth();
  rectMode(0);

  textBlock = loadImage("text.png");
}

void draw() {
  background(#F2FFE3);

  int bb = 30;   // Bottom border
  int lb = 55;  // Left side border

  for (int i = 0; i < YearStat.length; i++) {
    // for (int b = 0; i < YearStat06.length; i++) {
    int w = 50;    // Width of bars
    int s = 20;    // Space between bars
    float[] t  = new float[YearStat.length]; // Tall (for bars)
    t[i] = chosenData[i] * 4;
    int[] x = new int[YearStat.length];
    x[i] = int(lb + (i + .5) * (w + s));
    float[] y = new float[YearStat.length];
    y[i] = height - t[i]/2 -230; //aligns in the bottom
    textAlign(CENTER);
    text(chosenData[i]+"%", x[i], y[i] - t[i]/2 - 10);

    //stat bars
    rectMode(CENTER);
    if (x[i]<=120) {
      fill(pallette[0], 130);
    }

    if (x[i] > 120 && x[i] < 190) {
      fill(pallette[1], 130);
    }

    if (x[i] > 190 && x[i] < 260) {
      fill(pallette[2], 130);
    }

    if (x[i] > 260 && x[i] < 330) {
      fill(pallette[3], 130);
    }

    if (x[i] > 330 && x[i] < 400) {
      fill(pallette[4], 130);
    }

    if (x[i] > 400 && x[i] < 470) {
      fill(pallette[5], 130);
    }

    noStroke();
    rect(x[i], y[i], w, t[i]);

    fill(pallette[0]);

    // labels for X axis
    textAlign(CENTER);
    textFont(paragraph);
    fill(pallette[5]);
    text(YearStat[i], x[i], height-210);
  }

  // Line for X axis
  for (int j = 280; j< height-220; j+=20) {
    stroke(pallette[6]);
    line(45, j, 480, j);//horizontal
  }

  // Line and labels for Y axis
  textAlign(RIGHT);
  for (int i = 0; i < 60; i+=10) {
    text (i, 40, (height-225)-i*4);//vertical numbers
  }

  //_________________


  for (int i = 0; i < CountryBars.length; i++) {
    int w = 50;    // Width of bars
    int s = 20;    // Space between bars
    float[] t  = new float[CountryBars.length]; // Tall (for bars)
    t[i] = populationPerc[i];
    int[] x = new int[CountryBars.length];
    x[i] = int(lb + (i + .5) * (w + s) + 600);
    float[] y = new float[CountryBars.length];
    y[i] = height - t[i]/2 -230; //aligns in the bottom
    textAlign(CENTER);
    text(populationPerc[i]+"%", x[i]+600, y[i] - t[i]/2 - 440);

    // Line for X axis
    for (int j = 280; j< 540; j+=20) {
      stroke(pallette[6]);
      line(645, j, 1080, j);//horizontal
    }

    //rollover effect
    if ((mouseX > (x[i] - w)) && (mouseX < (x[i] + w)) && 
      (mouseY > (y[i] - t[i])) && (mouseY < (y[i] + t[i]))) {
      fill(#666666);
      rect(x[i]+20, y[i] - t[i]/2 - 80, 210, 55, 15);
      fill(#ffffff);
      textFont(paragraph);
      // Info on rollover...
      text("Mobile Phones" + ": " + mobileNum[i]  + "\n" + "Population" + PopNum[i], x[i]+20, y[i] - t[i]/2 - 80);
    } 

    if (x[i]<=720) {
      fill(pallette[0], 130);
    }

    if (x[i] > 720 && x[i] < 790) {
      fill(pallette[1], 130);
    }

    if (x[i] > 810 && x[i] < 860) {
      fill(pallette[2], 130);
    }

    if (x[i] > 880 && x[i] < 930) {
      fill(pallette[3], 130);
    }

    if (x[i] > 950 && x[i] < 1000) {
      fill(pallette[4], 130);
    }

    if (x[i] > 1020 && x[i] < 1070) {
      fill(pallette[5], 130);
    }

    noStroke();
    rect(x[i], y[i], w, t[i]);

    fill(pallette[0]);

    // labels for X axis
    textAlign(CENTER);
    textFont(paragraph);
    fill(pallette[5]);
    text(CountryBars[i], x[i], 540);
  }



  //_______________
  image(textBlock, width/2+50, 550);

  //title
  fill(pallette[5]);
  textAlign(CENTER);
  textFont(titleFont);
  text("Mobile Devices Will Outnumber People by the End of 2013", width/2, 60);

  textFont(paragraph);
  textAlign(LEFT);
  text("According to Cisco, by the end of 2013, there will be more mobile devices on Earth than people. The number of mobiles has grown a lot in the past year, and it shows no signs  ", 50, 100);
  text("of slowing. In fact, Cisco predicts global mobile data traffic will increase 13-fold by 2017, with more than 10 billion mobile-connected devices by then. It also believes mobile", 50, 120);
  text("network speeds will grow by seven times what it is now.", 50, 140);
  textAlign(LEFT);
  textFont(subtitleFont);
  text("Growth in Average Traffic per Device, 2012 to 2017", 50, 190);
  textFont(paragraph);
  text("The average traffic per device is expected to increase rapidly between 2012-2017.", 50,210);
  text("The graph below displays the estimated growth rate per device.", 50,230);
//  text("Overall mobile data traffic is expected to grow to 11.2 exabytes ", 50, 210);
//  text("per month by 2017, a 13-fold increase over 2012. Mobile data ", 50, 230);
//  text("traffic will grow at a CAGR of 66 percent from 2012to 2017.", 50, 250);

  textFont(subtitleFont);
  text("Device Usage, 2012", 660, 180);
  textFont(paragraph);
  text("In 2012 there were 87% as many phones as people. This chart displays the", 650, 210);
  text("percentage of phones vs people within the highest mobile consuming countries.", 650, 230);

  text("Mobile data services are well on their way to becoming necessities for many ", 50, 580);
  text("network users. Mobile voice service is already considered a necessity by most, ", 50, 600);
  text("and mobile data, video, and TV services are fast becoming an essential part of", 50, 620);
  text("consumers’ lives. Mobile subscribers are growing rapidly and bandwidth demand", 50, 640);
  text("due to data and video is increasing. The next 5 years are projected to provide", 50, 660);
  text("unabated mobile video adoption despite uncertain macroeconomic conditions in ", 50, 680);
  text("many parts of the world.", 50, 700);
  }

