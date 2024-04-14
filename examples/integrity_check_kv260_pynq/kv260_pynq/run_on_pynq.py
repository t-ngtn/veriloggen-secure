#!/usr/bin/env python
# coding: utf-8

# In[8]:


import time
import pynq
from pynq import Overlay, PL
PL.reset()
print(pynq.__version__)


# In[9]:


bitfile = "design_1.bit"
overlay = Overlay(bitfile)
overlay.ip_dict.keys()


# In[10]:


integrity_check = overlay.integrity_check_0


# In[11]:


dir(integrity_check)


# In[24]:


start_time = time.perf_counter()

integrity_check.write(0 * 4, 1)

while True:
    busy = integrity_check.read(1 * 4)
    if not busy:
        break

end_time = time.perf_counter()
print(f"time: {end_time - start_time} second")

is_secure = integrity_check.read(2 * 4)
print(f"is_secure: {is_secure}")

