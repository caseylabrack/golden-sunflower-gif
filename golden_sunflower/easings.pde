static class easings {
  
  static float linear (float t, float start, float change, float duration) {
    return start + change * (t/duration);
  }
  
  static float easeInOutQuad (float t, float b, float c, float d) {
  if ((t/=d/2) < 1) return c/2*t*t + b;
  return -c/2 * ((--t)*(t-2) - 1) + b;
}
 
  static float easeInOutQuart (float t, float b, float c, float d) {
   if ((t/=d/2) < 1) return c/2*t*t*t*t + b;
   return -c/2 * ((t-=2)*t*t*t - 2) + b; 
  }
  
  //not critically accurate for looping
  static float easeInExpo (float t, float b, float c, float d) {
    return (float)((t==0) ? b : c * Math.pow(2, 10 * (t/d - 1)) + b);
  }
  
  static float easeOutExpo (float t, float b, float c, float d) {
    return (float)((t==d) ? b+c : c * (-Math.pow(2, -10 * t/d) + 1) + b);
  }
  
  static double easeInOutExpo (float t, float b, float c, float d) {
    if (t==0) return b;
    if (t==d) return b+c;
    if ((t/=d/2) < 1) return c/2 * Math.pow(2, 10 * (t - 1)) + b;
    return c/2 * (-Math.pow(2, -10 * --t) + 2) + b;
  }
}
