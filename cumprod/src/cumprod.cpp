int cumprod(const double *in, const int size, double *out){
  double prod = 1;
  for(int i=0; i<size; i++){
    prod *= in[i];
    out[i] = prod;
  }
  return 0;
}
