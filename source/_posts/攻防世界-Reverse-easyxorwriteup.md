---
date: 2023-09-16 18:22
title: 攻防世界-Reverse-easyxorwriteup
tags: CTF
categories:
  - CTF
  - WP
  - RE
abbrlink: c57101a0
---

# 查壳

无壳

# 反编译

拉进漂亮姐姐中（IDA）

shift+F12看一下字串

![](https://z1.ax1x.com/2023/09/16/pPfDEYF.jpg)

首先看到一个关键信息，点进去，Ctrl+x交叉引用

![](https://z1.ax1x.com/2023/09/16/pPfDVW4.jpg)

F5看一下伪代码

```c++
int __cdecl main(int argc, const char **argv, const char **envp)
{
  int v3; // eax
  char v4; // al
  int v5; // eax
  char v7; // [rsp+33h] [rbp-Dh]
  char v8; // [rsp+33h] [rbp-Dh]
  int v9; // [rsp+34h] [rbp-Ch]
  int i; // [rsp+38h] [rbp-8h]
  int v11; // [rsp+3Ch] [rbp-4h]

  _main();
  v11 = 0;
  v9 = 0;
  puts("Please input your flag:");
  while ( 1 )
  {
    v8 = getchar();
    if ( v8 == 10 )
      break;
	v7 = key[v9 % 4] ^ v8;			//输入的字符，进行异或操作，得到v7
    while ( 1 )						
    {
      v4 = v7--;					//循环v7次
      if ( v4 <= 0 )				//此while循环是向s[]中输入v7个1
        break;
      v3 = v11++;
      s[v3] = 1;
    }
    v5 = v11++;						//输出v7个1后，使用0与下一串1隔开	
    s[v5] = 0;						
    ++v9;
  }
  while ( v11 <= 2559 )				//输入的字符全部转化为1之后，不够2559个的话填充-1（255）
    s[v11++] = -1;
  for ( i = 0; i <= 2559; ++i )
  {
    if ( r[i] != s[i] )				//进行比较
    {
      puts("Lose lose lose!");
      break;
    }
  }
  if ( i == 2560 )
    puts("Win win win!");
  system("pause");
  return 0;
}
```

其中r是

```
r = [0x35, 0x2F, 0x2F, 0x32, 0x28, 0x14, 0x27, 0x3B, 0x3D, 0x70,
     0x3C, 0x0A, 0x3D, 0x73, 0x3A, 0x0A, 0x1F, 0x73, 0x3D, 0x66,
     0x21, 0x1C, 0x6D, 0x28]
```

key是SCNU

# 解密

写一下解密python

```python
r = [0x35, 0x2F, 0x2F, 0x32, 0x28, 0x14, 0x27, 0x3B, 0x3D, 0x70,
     0x3C, 0x0A, 0x3D, 0x73, 0x3A, 0x0A, 0x1F, 0x73, 0x3D, 0x66,
     0x21, 0x1C, 0x6D, 0x28]
key = "SCNU"
flag=''
for i in range(len(r)):
    flag+=chr(ord(key[i % 4]) ^ r[i])
print(flag)
```

# FLAG


```
flag{Winn3r_n0t_L0s3r_#}
```

