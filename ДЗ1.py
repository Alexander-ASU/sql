#!/usr/bin/env python
# coding: utf-8

# Задача №1

# In[ ]:


long_phrase = 'Насколько проще было бы писать программы, если бы не заказчик'
short_phrase = '640Кб должно хватить для любых задач. Билл Гейтс(по легенде)'
len_long_phrase = len(long_phrase)
len_short_phrase = len(short_phrase)

if len_long_phrase > len_short_phrase:
    print('True')
else:
    print('False')


# Задача №2

# In[20]:


text = 'Если программист в 9-00 утра на работе, значит, он там и ночевал'
acc_a = 0
acc_i = 0
for i in range(len(text)):
    if 'а'== text[i]:
        acc_a = acc_a + 1
    elif 'и'== text[i]:
        acc_i = acc_i + 1
print(acc_a)
print(acc_i)


# Задача №3 Объем файла = 2234564 байта

# 1Кб = 1024 байта; 1Мб = 1024 Кб

# In[25]:


stat = 2234564
rez = (stat/1024)/1024
print(rez)


# Задача №4 Указываем значения в радианах

# In[32]:


import math
rez = math.sin(0.52)
print(rez)


# Задача №5

# In[33]:


rez = 0.1 + 0.2
print(rez)


# Задача №6

# In[36]:


a = 1
b = 3
a = b-a
b = b-a
a = a+b

print(b)
print(a)


# Задача №7

# In[53]:


num = 10011
num = str(num)
lin = len(num) - 1
buff = 0
for i in range(len(num)):
    buff += int(num[i])*2**(lin)
    lin = lin-1
print(buff)

