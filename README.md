# Mathematical-Modeling
This is a discrete math model to predict population trend based on different fertility mode

Codes are run in GNU Octave, with grammar a little different from that of Matlab. 
Input:
1. population data of all ages in the first year
2. death rates of all ages (which are considered unchanngeable towards time)
3. woman proportions of all ages (which are considered unchangeable towards time)
4. beta: the average number of children a woman give birth to in her entire life, which is mainly affected by social policies. 
5. the number of years to predict

Output: 
1. total population in all predicted years

以.m结尾的是代码文本

输入：
1. 第一年各个年龄层的人口数据
2. 各个年龄层的死亡率（认为不随时间变化）
3. 各个年龄层的女性人口比例（认为不随时间变化）
4. 每个育龄妇女平均生育婴儿数beta（受二孩政策影响）
5. 迭代次数/预测年份数

输出：
1. 所有年份人口数
2. （未实现）所有年份各年龄层人口数
