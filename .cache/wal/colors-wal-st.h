const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#000000", /* black   */
  [1] = "#3B698A", /* red     */
  [2] = "#3F77A1", /* green   */
  [3] = "#477796", /* yellow  */
  [4] = "#487EA1", /* blue    */
  [5] = "#6194AD", /* magenta */
  [6] = "#5F9DC1", /* cyan    */
  [7] = "#c3c4c5", /* white   */

  /* 8 bright colors */
  [8]  = "#5c6470",  /* black   */
  [9]  = "#3B698A",  /* red     */
  [10] = "#3F77A1", /* green   */
  [11] = "#477796", /* yellow  */
  [12] = "#487EA1", /* blue    */
  [13] = "#6194AD", /* magenta */
  [14] = "#5F9DC1", /* cyan    */
  [15] = "#c3c4c5", /* white   */

  /* special colors */
  [256] = "#000000", /* background */
  [257] = "#c3c4c5", /* foreground */
  [258] = "#c3c4c5",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
