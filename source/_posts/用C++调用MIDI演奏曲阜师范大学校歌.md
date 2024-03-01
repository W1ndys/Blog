---
date: 2023-08-25 22:45
title: 用C++调用MIDI演奏曲阜师范大学校歌
tags: QFNU
categories: QFNU
abbrlink: e0155dca
---

# 背景介绍

有一天在B站上看到有大佬用c++演奏音乐，一开始还不知道是调用MIDI函数，后来百度，查CSDN才知道是用函数调用，我直接转手写一个自己学校的校歌



# 前期准备

首先准备好校歌的键盘，想必大家通知书上都有吧

然后是c++编译器，我用Visual Studio 2022

然后是一些乐理知识，由于我是一个纯工科生，对乐理知识了解程度为0，只能大体看音调，不认识节拍，无奈只能去群里找懂行的人，很巧就有一个19的师姐还一个22的同学解答了我的疑惑



# 代码编写

Scale函数

这个函数是一个简谱对照表，相当于base64编码的编码表

```c++
enum Scale

{

    Rest = 0, C8 = 108, B7 = 107, A7s = 106, A7 = 105, G7s = 104, G7 = 103, F7s = 102, F7 = 101, E7 = 100,

    D7s = 99, D7 = 98, C7s = 97, C7 = 96, B6 = 95, A6s = 94, A6 = 93, G6s = 92, G6 = 91, F6s = 90, F6 = 89,

    E6 = 88, D6s = 87, D6 = 86, C6s = 85, C6 = 84, B5 = 83, A5s = 82, A5 = 81, G5s = 80, G5 = 79, F5s = 78,

    F5 = 77, E5 = 76, D5s = 75, D5 = 74, C5s = 73, C5 = 72, B4 = 71, A4s = 70, A4 = 69, G4s = 68, G4 = 67,

    F4s = 66, F4 = 65, E4 = 64, D4s = 63, D4 = 62, C4s = 61, C4 = 60, B3 = 59, A3s = 58, A3 = 57, G3s = 56,

    G3 = 55, F3s = 54, F3 = 53, E3 = 52, D3s = 51, D3 = 50, C3s = 49, C3 = 48, B2 = 47, A2s = 46, A2 = 45,

    G2s = 44, G2 = 43, F2s = 42, F2 = 41, E2 = 40, D2s = 39, D2 = 38, C2s = 37, C2 = 36, B1 = 35, A1s = 34,

    A1 = 33, G1s = 32, G1 = 31, F1s = 30, F1 = 29, E1 = 28, D1s = 27, D1 = 26, C1s = 25, C1 = 24, B0 = 23,

    A0s = 22, A0 = 21

};
```

然后是Voice函数，这个是控制声音的

```C++
enum Voice

{

    X1 = C2, X2 = D2, X3 = E2, X4 = F2, X5 = G2, X6 = A2, X7 = B2,

    L1 = C3, L2 = D3, L3 = E3, L4 = F3, L5 = G3, L6 = A3, L7 = B3,

    M1 = C4, M2 = D4, M3 = E4, M4 = F4, M5 = G4, M6 = A4, M7 = B4,

    H1 = C5, H2 = D5, H3 = E5, H4 = F5, H5 = G5, H6 = A5, H7 = B5,

    LOW_SPEED = 500, MIDDLE_SPEED = 400, HIGH_SPEED = 300,

    _ = 0XFF

};
```

然后就到最核心的了，就是编谱，把简谱翻译成代码

```c++
void   QFNU()
{
    HMIDIOUT handle;
    midiOutOpen(&handle, 0, 0, 0, CALLBACK_NULL);
    int volume = 0x7f;
    int voice = 0x0;
    int sleep = 300;
    int QFNU[] =
    {
         M1,_,M1,_,M1,_,M2,_,
        M3,_,M5,_,M5,_,_,_,
        M6,_,M6,_,M5,_,M3,_,
        M1,_,M2,M3,M2,_,_,_,
        M3,_,M3,_,M5,_,M5,_,
        M3,_,M2,_,M1,_,L6,_,
        L5,L6,M1,M2,M3,_,M5,_,
        M2,_,_,_,_,_,
        M1,_,M1,_,M1,_,M2,_,
        M3,_,M5,_,M5,_,_,
        M6,_,M6,_,M5,_,M3,_,
        M1,_,M2,M3,M2,_,_,
        M3,_,M3,_,M5,_,M5,_,
        M3,_,M2,_,M1,_,L6,_,
        L5,L6,M1,M2,M3,_,M2,_,
        M1,_,_,_,_,
        H1,_,H1,_,H1,_,_,_,
        M3,_,M5,M6,M5,_,_,_,
        M6,_,M5,_,M4,_,M1,_,
        M7,_,M6,M7,M5,_,_,_,
        M6,_,H1,_,H1,_,H1,_,
        M3,_,M5,M6,M6,_,M6,_,
        M6,M5,M4,M4,M4,_,_,_,
        M2,M2,M2,M3,_,M2,_,_,_,
        H1,_,H1,_,H1,_,_,_,
        M3,_,M5,M6,M5,_,_,_,
        M6,_,M5,_,M4,_,M1,_,
        M7,_,M6,M7,M5,_,_,_,
        M6,_,H1,_,H1,_,H1,_,
        M3,M3,M5,M6,M6,_,_,_,
        M2,M3,M5,M5,M5,M5,M5,M5,_,
        H2,_,H2,_,M6,_,M7,_,
        H1,H1,H1,H1,H1,H1,
    };
    	for (auto i : QFNU)
    {
        if (i == LOW_SPEED || i == HIGH_SPEED || i == MIDDLE_SPEED)
        {
            sleep = i;
            continue;
        }
        if (i == 0) { sleep = 150; continue; }
        if (i == 700) { Sleep(150); continue; }
        if (i == _)
        {
            Sleep(300);
            continue;
        }
        voice = (volume << 16) + ((i) << 8) + 0x90;
        midiOutShortMsg(handle, voice);
        cout << voice << endl;
        Sleep(sleep);
    }
    midiOutClose(handle);
}
```

最后用int main主函数调用就可以

```c++
int main()
{
    QFNU();//犁牛之子
    return 0;
}
```



# 完整代码

```C++
#include<iostream>
#include<Windows.h>
#pragma comment(lib,"winmm.lib")

using namespace std;

enum Scale

{

    Rest = 0, C8 = 108, B7 = 107, A7s = 106, A7 = 105, G7s = 104, G7 = 103, F7s = 102, F7 = 101, E7 = 100,

    D7s = 99, D7 = 98, C7s = 97, C7 = 96, B6 = 95, A6s = 94, A6 = 93, G6s = 92, G6 = 91, F6s = 90, F6 = 89,

    E6 = 88, D6s = 87, D6 = 86, C6s = 85, C6 = 84, B5 = 83, A5s = 82, A5 = 81, G5s = 80, G5 = 79, F5s = 78,

    F5 = 77, E5 = 76, D5s = 75, D5 = 74, C5s = 73, C5 = 72, B4 = 71, A4s = 70, A4 = 69, G4s = 68, G4 = 67,

    F4s = 66, F4 = 65, E4 = 64, D4s = 63, D4 = 62, C4s = 61, C4 = 60, B3 = 59, A3s = 58, A3 = 57, G3s = 56,

    G3 = 55, F3s = 54, F3 = 53, E3 = 52, D3s = 51, D3 = 50, C3s = 49, C3 = 48, B2 = 47, A2s = 46, A2 = 45,

    G2s = 44, G2 = 43, F2s = 42, F2 = 41, E2 = 40, D2s = 39, D2 = 38, C2s = 37, C2 = 36, B1 = 35, A1s = 34,

    A1 = 33, G1s = 32, G1 = 31, F1s = 30, F1 = 29, E1 = 28, D1s = 27, D1 = 26, C1s = 25, C1 = 24, B0 = 23,

    A0s = 22, A0 = 21

};

enum Voice

{

    X1 = C2, X2 = D2, X3 = E2, X4 = F2, X5 = G2, X6 = A2, X7 = B2,

    L1 = C3, L2 = D3, L3 = E3, L4 = F3, L5 = G3, L6 = A3, L7 = B3,

    M1 = C4, M2 = D4, M3 = E4, M4 = F4, M5 = G4, M6 = A4, M7 = B4,

    H1 = C5, H2 = D5, H3 = E5, H4 = F5, H5 = G5, H6 = A5, H7 = B5,

    LOW_SPEED = 500, MIDDLE_SPEED = 400, HIGH_SPEED = 300,

    _ = 0XFF

};

void   QFNU()
{
    HMIDIOUT handle;
    midiOutOpen(&handle, 0, 0, 0, CALLBACK_NULL);
    int volume = 0x7f;
    int voice = 0x0;
    int sleep = 300;
    int QFNU[] =
    {
         M1,_,M1,_,M1,_,M2,_,
        M3,_,M5,_,M5,_,_,_,
        M6,_,M6,_,M5,_,M3,_,
        M1,_,M2,M3,M2,_,_,_,
        M3,_,M3,_,M5,_,M5,_,
        M3,_,M2,_,M1,_,L6,_,
        L5,L6,M1,M2,M3,_,M5,_,
        M2,_,_,_,_,_,
        M1,_,M1,_,M1,_,M2,_,
        M3,_,M5,_,M5,_,_,
        M6,_,M6,_,M5,_,M3,_,
        M1,_,M2,M3,M2,_,_,
        M3,_,M3,_,M5,_,M5,_,
        M3,_,M2,_,M1,_,L6,_,
        L5,L6,M1,M2,M3,_,M2,_,
        M1,_,_,_,_,
        H1,_,H1,_,H1,_,_,_,
        M3,_,M5,M6,M5,_,_,_,
        M6,_,M5,_,M4,_,M1,_,
        M7,_,M6,M7,M5,_,_,_,
        M6,_,H1,_,H1,_,H1,_,
        M3,_,M5,M6,M6,_,M6,_,
        M6,M5,M4,M4,M4,_,_,_,
        M2,M2,M2,M3,_,M2,_,_,_,
        H1,_,H1,_,H1,_,_,_,
        M3,_,M5,M6,M5,_,_,_,
        M6,_,M5,_,M4,_,M1,_,
        M7,_,M6,M7,M5,_,_,_,
        M6,_,H1,_,H1,_,H1,_,
        M3,M3,M5,M6,M6,_,_,_,
        M2,M3,M5,M5,M5,M5,M5,M5,_,
        H2,_,H2,_,M6,_,M7,_,
        H1,H1,H1,H1,H1,H1,
    };
    for (auto i : QFNU)
    {
        if (i == LOW_SPEED || i == HIGH_SPEED || i == MIDDLE_SPEED)
        {
            sleep = i;
            continue;
        }
        if (i == 0) { sleep = 150; continue; }
        if (i == 700) { Sleep(150); continue; }
        if (i == _)
        {
            Sleep(300);
            continue;
        }
        voice = (volume << 16) + ((i) << 8) + 0x90;
        midiOutShortMsg(handle, voice);
        cout << voice << endl;
        Sleep(sleep);
    }
    midiOutClose(handle);
}

int main()
{
    QFNU();//犁牛之子
    return 0;
}
```

# 后期处理

简单做个视频剪辑一下

被曲阜师范大学官方抖音号发表咯！~

复制口令戳下面代码块左上角↓

```
7.94 SYm:/ 简单用代码做个音乐，一起看看美好的曲园！# 曲阜师范大学 # 代码 # 编程 # 我在大学等你  https://v.douyin.com/iJnnEGjb/ 复制此链接，打开Dou音搜索，直接观看视频！
```

