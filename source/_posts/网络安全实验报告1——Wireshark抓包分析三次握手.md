---
title: "网络安全实验报告1——Wireshark抓包分析三次握手"
tags: [网络安全实验报告, Wireshark]
categories: [网络安全, 实验报告]
date: 2024-03-27 10:25:29
---

# 网络安全实验报告 1——Wireshark 抓包分析三次握手

## 抓包

我抓的是 QFNU 官网：[https://www.qfnu.edu.cn/](https://www.qfnu.edu.cn/)

找到 IPv6 地址

![image-20240327112720202](../img/CyberSecurity/1/image-20240327112720202.png)

## 过滤包

过滤器输入以下内容过滤出 IP 地址的 tcp 协议包

```
ipv6.addr == 2001:250:581c:608:202:194:186:19 && tcp
```

![image-20240327112750144](../img/CyberSecurity/1/image-20240327112750144.png)

## 分析 tcp 包

### 第一次握手包

#### 报文数据

```
Frame 152: 86 bytes on wire (688 bits), 86 bytes captured (688 bits) on interface \Device\NPF_{2C528628-BD70-46E8-A2DC-6A91B43D20AE}, id 0
Ethernet II, Src: fe:d8:8f:31:3a:50 (fe:d8:8f:31:3a:50), Dst: Intel_1b:a7:9c (84:7b:57:1b:a7:9c)
Internet Protocol Version 6, Src: 2001:250:581c:608:202:194:186:19, Dst: 2409:893d:470e:835f:fce0:9b9d:16ed:e7d9
Transmission Control Protocol, Src Port: 443, Dst Port: 12882, Seq: 0, Ack: 1, Len: 0
    Source Port: 443
    Destination Port: 12882
    [Stream index: 30]
    [Conversation completeness: Complete, WITH_DATA (47)]
    [TCP Segment Len: 0]
    Sequence Number: 0    (relative sequence number)
    Sequence Number (raw): 1574585123
    [Next Sequence Number: 1    (relative sequence number)]
    Acknowledgment Number: 1    (relative ack number)
    Acknowledgment number (raw): 3145687753
    1000 .... = Header Length: 32 bytes (8)
    Flags: 0x012 (SYN, ACK)
        000. .... .... = Reserved: Not set
        ...0 .... .... = Accurate ECN: Not set
        .... 0... .... = Congestion Window Reduced: Not set
        .... .0.. .... = ECN-Echo: Not set
        .... ..0. .... = Urgent: Not set
        .... ...1 .... = Acknowledgment: Set
        .... .... 0... = Push: Not set
        .... .... .0.. = Reset: Not set
        .... .... ..1. = Syn: Set
        .... .... ...0 = Fin: Not set
        [TCP Flags: ·······A··S·]
    Window: 64800
    [Calculated window size: 64800]
    Checksum: 0xea7c [unverified]
    [Checksum Status: Unverified]
    Urgent Pointer: 0
    Options: (12 bytes), Maximum segment size, No-Operation (NOP), No-Operation (NOP), SACK permitted, No-Operation (NOP), Window scale
    [Timestamps]
    [SEQ/ACK analysis]

```

#### 分析

- **Ethernet II**：以太网 II 帧格式，包括源 MAC 地址和目的 MAC 地址。
  - 源 MAC 地址：fe: d8: 8f: 31: 3a: 50
  - 目的 MAC 地址：84: 7b: 57: 1b: a7: 9c
- **Internet Protocol Version 6 (IPv6)**：IPv6 协议，包括源 IPv6 地址和目的 IPv6 地址。
  - 源 IPv6 地址：2001: 250: 581c: 608: 202: 194: 186: 19
  - 目的 IPv6 地址：2409: 893d: 470e: 835f: fce0: 9b9d: 16ed: e7d9
- **Transmission Control Protocol (TCP)**：传输控制协议，描述了 TCP 连接的细节。
  - 源端口号：443
  - 目的端口号：12882
  - 序列号 (Sequence Number)：0
  - 确认号 (Acknowledgment Number)：1
  - 标志 (Flags)：SYN 和 ACK 均置位，表示这是一个带有 SYN 和 ACK 标志的握手包。
  - 窗口大小 (Window Size)：64800
  - 选项 (Options)：最大段大小 (Maximum segment size)，无操作 (NOP)，选择确认(SACK permitted)，无操作 (NOP)，窗口缩放 (Window scale)。
  - 时间戳 (Timestamps)：包含了时间戳选项。
  - 检验和 (Checksum)：0xea7c

### 第二次握手包分析

#### 报文数据

```
	Frame 153: 74 bytes on wire (592 bits), 74 bytes captured (592 bits) on interface \Device\NPF_{2C528628-BD70-46E8-A2DC-6A91B43D20AE}, id 0
Ethernet II, Src: Intel_1b:a7:9c (84:7b:57:1b:a7:9c), Dst: fe:d8:8f:31:3a:50 (fe:d8:8f:31:3a:50)
Internet Protocol Version 6, Src: 2409:893d:470e:835f:fce0:9b9d:16ed:e7d9, Dst: 2001:250:581c:608:202:194:186:19
Transmission Control Protocol, Src Port: 12882, Dst Port: 443, Seq: 1, Ack: 1, Len: 0
    Source Port: 12882
    Destination Port: 443
    [Stream index: 30]
    [Conversation completeness: Complete, WITH_DATA (47)]
    [TCP Segment Len: 0]
    Sequence Number: 1    (relative sequence number)
    Sequence Number (raw): 3145687753
    [Next Sequence Number: 1    (relative sequence number)]
    Acknowledgment Number: 1    (relative ack number)
    Acknowledgment number (raw): 1574585124
    0101 .... = Header Length: 20 bytes (5)
    Flags: 0x010 (ACK)
        000. .... .... = Reserved: Not set
        ...0 .... .... = Accurate ECN: Not set
        .... 0... .... = Congestion Window Reduced: Not set
        .... .0.. .... = ECN-Echo: Not set
        .... ..0. .... = Urgent: Not set
        .... ...1 .... = Acknowledgment: Set
        .... .... 0... = Push: Not set
        .... .... .0.. = Reset: Not set
        .... .... ..0. = Syn: Not set
        .... .... ...0 = Fin: Not set
        [TCP Flags: ·······A····]
    Window: 512
    [Calculated window size: 131072]
    [Window size scaling factor: 256]
    Checksum: 0x94be [unverified]
    [Checksum Status: Unverified]
    Urgent Pointer: 0
    [Timestamps]
    [SEQ/ACK analysis]

```

#### 分析

1. **帧信息**：
   - 数据长度：74字节，592位。
   - 源地址（Src）：Intel_1b:a7:9c (84:7b:57:1b:a7:9c)
   - 目标地址（Dst）：fe:d8:8f:31:3a:50
2. **网络协议**：
   - IPv6：源IP地址为2409:893d:470e:835f:fce0:9b9d:16ed:e7d9，目标IP地址为2001:250:581c:608:202:194:186:19。
3. **传输层协议**：
   - TCP：
     - 源端口（Src Port）：12882
     - 目标端口（Dst Port）：443
     - 序列号（Sequence Number）：1，表示本次发送的数据段序列号。
     - 确认号（Acknowledgment Number）：1，表示期望接收到的下一个数据段的序列号。
     - 标志（Flags）：ACK（Acknowledgment），表示确认号字段有效。
     - 窗口大小（Window）：512，表示发送端的接收缓冲区大小。
     - 校验和（Checksum）：0x94be。
     - 时间戳（Timestamps）：该选项在此包中未提供具体值。
4. **其他信息**：
   - 会话完整性（Conversation completeness）：完整，有数据传输。
   - TCP段长度（TCP Segment Len）：0，表示此包中未包含数据。

### 第三次握手包

#### 报文数据

```
Frame 161: 74 bytes on wire (592 bits), 74 bytes captured (592 bits) on interface \Device\NPF_{2C528628-BD70-46E8-A2DC-6A91B43D20AE}, id 0
Ethernet II, Src: fe:d8:8f:31:3a:50 (fe:d8:8f:31:3a:50), Dst: Intel_1b:a7:9c (84:7b:57:1b:a7:9c)
Internet Protocol Version 6, Src: 2001:250:581c:608:202:194:186:19, Dst: 2409:893d:470e:835f:fce0:9b9d:16ed:e7d9
Transmission Control Protocol, Src Port: 443, Dst Port: 12881, Seq: 1, Ack: 808, Len: 0
    Source Port: 443
    Destination Port: 12881
    [Stream index: 31]
    [Conversation completeness: Complete, WITH_DATA (47)]
    [TCP Segment Len: 0]
    Sequence Number: 1    (relative sequence number)
    Sequence Number (raw): 839341445
    [Next Sequence Number: 1    (relative sequence number)]
    Acknowledgment Number: 808    (relative ack number)
    Acknowledgment number (raw): 1312419164
    0101 .... = Header Length: 20 bytes (5)
    Flags: 0x010 (ACK)
        000. .... .... = Reserved: Not set
        ...0 .... .... = Accurate ECN: Not set
        .... 0... .... = Congestion Window Reduced: Not set
        .... .0.. .... = ECN-Echo: Not set
        .... ..0. .... = Urgent: Not set
        .... ...1 .... = Acknowledgment: Set
        .... .... 0... = Push: Not set
        .... .... .0.. = Reset: Not set
        .... .... ..0. = Syn: Not set
        .... .... ...0 = Fin: Not set
        [TCP Flags: ·······A····]
    Window: 501
    [Calculated window size: 64128]
    [Window size scaling factor: 128]
    Checksum: 0x220d [unverified]
    [Checksum Status: Unverified]
    Urgent Pointer: 0
    [Timestamps]
    [SEQ/ACK analysis]

```

#### 分析

1. **帧信息**：

   - 数据长度：74字节，592位。
   - 源地址（Src）：fe:d8:8f:31:3a:50
   - 目标地址（Dst）：Intel_1b:a7:9c (84:7b:57:1b:a7:9c)

2. **网络协议**：

   - IPv6：源IP地址为2001:250:581c:608:202:194:186:19，目标IP地址为2409:893d:470e:835f:fce0:9b9d:16ed:e7d9。

3. **传输层协议**：

   - TCP：
     - 源端口（Src Port）：443
     - 目标端口（Dst Port）：12881
     - 序列号（Sequence Number）：1，表示本次发送的数据段序列号。
     - 确认号（Acknowledgment Number）：808，表示接收到的下一个期望的数据段序列号。
     - 标志（Flags）：ACK（Acknowledgment），表示确认号字段有效。
     - 窗口大小（Window）：501，表示发送端的接收缓冲区大小。
     - 校验和（Checksum）：0x220d。

4. **其他信息**：

   - 会话完整性（Conversation completeness）：完整，有数据传输。
   - TCP段长度（TCP Segment Len）：0，表示此包中未包含数据。

   
