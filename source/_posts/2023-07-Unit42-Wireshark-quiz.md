---
title: Crossing the Line Unit 42 Wireshark Quiz for RedLine Stealer
tags: [流量分析]
categories: [流量分析]
abbrlink: dbf9c8f7
date: 2024-07-12 15:43:33
---

# Crossing the Line Unit 42 Wireshark Quiz for RedLine Stealer

## Quiz Questions

### What is the date and time in UTC the infection started?

- 感染开始的 UTC 日期和时间是什么时候？
- 感染于 2023 年 7 月 10 日 22：39 UTC 开始。

### What is the IP address of the infected Windows client?

- 受感染的 Windows 客户端的 IP 地址是什么？
- 受感染的 Windows 客户端 IP 地址：10.7.10 [.] 47

### What is the MAC address of the infected Windows client?

- 受感染的 Windows 客户端的 MAC 地址是什么？
- 受感染的 Windows 客户端 MAC 地址：80：86：5b：ab：1e：c4

### What is the hostname of the infected Windows client?

- 受感染的 Windows 客户端的主机名是什么？
- 受感染的 Windows 主机名：DESKTOP-9PEA63H

### What is the user account name from the infected Windows host?

- 受感染的 Windows 主机的用户帐户名称是什么？
- 受感染的 Windows 客户端 IP 用户帐户名称：rwalters

### What type of information did this RedLine Stealer try to steal?

- 这个 RedLine Stealer 试图窃取什么类型的信息？
- RedLine 恶意软件试图窃取的信息：
  - 受害者桌面上的各种类型的文件
  - 受害者的“文档”文件夹中的各种类型的文件
  - Chrome、Chromium、Edge、Opera、Vivaldi 和其他各种网络浏览器的用户数据
  - 各种加密货币钱包的数据和这些加密货币钱包的浏览器插件
  - 来自其他应用程序的 API 密钥和登录凭据

## Answer

### Pcap 分析：受害者详细信息

![../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712095107113](../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712095107113.png)

感染于 2023 年 7 月 10 日 22：39 UTC 开始。

![../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712095823382](../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712095823382.png)

确定受感染者的 IP 地址和 MAC 地址

通过筛选 nbns 确定受害者主机名

![../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712100105392](../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712100105392.png)

![../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712100726654](../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712100726654.png)

通过 Kerberos 身份验证流量验证受害者的主机名和 Windows 用户帐户名。筛选 kerberos.CNameString 查找 Windows 用户帐户名 rwalters

![../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712100510846](../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712100510846.png)

### Pcap 分析：恶意 Web 流量

利用 `(http.request or tls.handshake.type eq 1) and !(ssdp)` 过滤出 Web 流量

发现三个未加密的 HTTP GET 请求

![../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712100949555](../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712100949555.png)

追踪 623start [.] 的任一流量

![../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712101143122](../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712101143122.png)

TCP 流显示可能的 PowerShell 生成的流量。

虽然 User-Agent 字符串可能被恶意软件或 Web 浏览器扩展欺骗，但 User-Agent 行中的 WindowsPowerShell 是一个可靠的指示器，表明此流量是由 PowerShell 脚本生成的。这两个 HTTP GET 请求的 URL 是：

- hxxp://623start [.] site/?status = start&av = Windows%20Defender
- hxxp://623start [.] site/?status = install

这些请求都从服务器返回了 404 HTTP 错误。第一个 HTTP 请求报告了受害主机上使用的防病毒软件。在这种情况下，av = Windows%20Defender 指示 Windows Defender 是防病毒软件。第二个 URL 报告此恶意软件的安装状态。

最后一个未加密的 HTTP GET 请求是 hxxp://guiatelefonos [.] com/data/czx.jpg 中。遵循此 GET 请求的 TCP 流。TCP 流显示此 URL 重定向到同一 URL 的 HTTPS 版本

![../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712101437450](../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712101437450.png)

http URL 到 guiatelefonos [.] com 重定向到 HTTPS URL。

`hxxps://guiatelefonos [.] com/data/czx.jpg`

### Pcap 分析：RedLine Stealer 数据泄露

使用下面命令过滤

`tcp.flags eq 0x0002 and !(tcp.port eq 443) and !(tcp.port eq 80) and !(ip.dst eq 10.7.10.0/24)`

此筛选器搜索表示 TCP 流开头的 TCP SYN 段。搜索将排除通过 TCP 端口 80 和 TCP 端口 443 的任何 Web 流量。此筛选器还会排除从此 AD 环境发送到内部 IP 地址的任何 SYN 段。结果显示发送到 194.26.135 的单个 TCP SYN 段 [.] 119 通过 TCP 端口 12432

![../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712101757863](../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712101757863.png)

来自 TCP 流的初始字符串包括 tcp://194.26.135 [.] 处的 C2 通道。119：12432/ 和使用 tempuri [.] 的 URL 组织。术语“tempuri”是“临时 URI”的缩写，域 tempuri [.] org 是 Microsoft 开发工具（如 Visual Studio）中使用的占位符命名空间 URI。在我们的 RedLine Stealer 感染的任何其他流量中均未看到此 tempuri 域。

选择从服务器发送到受感染的 Windows 主机的数据

![../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712102141393](../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712102141393.png)

下图突出显示了这种感染在受害者的用户配置文件下寻找的数据。

![../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712104612459](../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712104612459.png)

该列表包括受害者桌面和受害者的“文档”文件夹上的通配符搜索。这包括文本文件、Word 文档和加密货币钱包文件，如下所示。

- %userprofile%\Desktop|_.txt，_.doc _，_ key _，_ wallet _，_ seed\*|0
- %userprofile%\Documents|_.txt，_.doc _，_ key _，_ wallet _，_ seed\*|0

然后，该列表根据受害者在其用户配置文件中受害者的 AppData 目录下的预期位置指示来自不同应用程序的数据。该列表按字母顺序显示在下面。

- %USERPROFILE%\AppData\Local\360Browser\Browser\User Data
- %USERPROFILE%\AppData\Local\7Star\7Star\User Data
- %USERPROFILE%\AppData\Local\Amigo\User\User Data
- %USERPROFILE%\AppData\Local\Battle.net
- %USERPROFILE%\AppData\Local\BraveSoftware\Brave-Browser\User Data
- %USERPROFILE%\AppData\Local\CatalinaGroup\Citrio\User Data
- %USERPROFILE%\AppData\Local\CentBrowser\User Data
- %USERPROFILE%\AppData\Local\Chedot\User Data
- %USERPROFILE%\AppData\Local\Chromium\User Data
- %USERPROFILE%\AppData\Local\Chromodo\User Data
- %USERPROFILE%\AppData\Local\CocCoc\Browser\User Data
- %USERPROFILE%\AppData\Local\Comodo\Dragon\User Data
- %USERPROFILE%\AppData\Local\Comodo\User Data
- %USERPROFILE%\AppData\Local\Coowon\Coowon\User Data
- %USERPROFILE%\AppData\Local\CryptoTab Browser\User Data
- %USERPROFILE%\AppData\Local\Elements Browser\User Data
- %USERPROFILE%\AppData\Local\Epic Privacy Browser\User Data
- %USERPROFILE%\AppData\Local\Fenrir Inc\Sleipnir5\setting\modules\ChromiumViewer
- %USERPROFILE%\AppData\Local\Google(x86)\Chrome\User Data
- %USERPROFILE%\AppData\Local\Google\Chrome\User Data
- %USERPROFILE%\AppData\Local\Iridium\User Data
- %USERPROFILE%\AppData\Local\K-Melon\User Data
- %USERPROFILE%\AppData\Local\Kometa\User Data
- %USERPROFILE%\AppData\Local\liebao\User Data
- %USERPROFILE%\AppData\Local\Mail.Ru\Atom\User Data
- %USERPROFILE%\AppData\Local\MapleStudio\ChromePlus\User Data
- %USERPROFILE%\AppData\Local\Maxthon3\User Data
- %USERPROFILE%\AppData\Local\Microsoft\Edge\User Data
- %USERPROFILE%\AppData\Local\Nichrome\User Data
- %USERPROFILE%\AppData\Local\NVIDIA Corporation\NVIDIA GeForce Experience
- %USERPROFILE%\AppData\Local\Orbitum\User Data
- %USERPROFILE%\AppData\Local\QIP Surf\User Data
- %USERPROFILE%\AppData\Local\Sputnik\Sputnik\User Data
- %USERPROFILE%\AppData\Local\Steam
- %USERPROFILE%\AppData\Local\Torch\User Data
- %USERPROFILE%\AppData\Local\uCozMedia\Uran\User Data
- %USERPROFILE%\AppData\Local\Uran\User Data
- %USERPROFILE%\AppData\Local\Vivaldi\User Data
- %USERPROFILE%\AppData\Local\Yandex\YandexBrowser\User Data
- %USERPROFILE%\AppData\Roaming\8pecxstudios\Cyberfox
- %USERPROFILE%\AppData\Roaming\Comodo\IceDragon
- %USERPROFILE%\AppData\Roaming\K-Meleon
- %USERPROFILE%\AppData\Roaming\Moonchild Productions\Pale Moon
- %USERPROFILE%\AppData\Roaming\Mozilla\Firefox
- %USERPROFILE%\AppData\Roaming\NETGATE Technologies\BlackHaw
- %USERPROFILE%\AppData\Roaming\Opera Software\
- %USERPROFILE%\AppData\Roaming\Thunderbird
- %USERPROFILE%\AppData\Roaming\Waterfox

再往下滚动一点，我们发现似乎是这种感染寻找的各种加密货币钱包，如下图 11 所示。这些数据包括基于 Chromium 的 Web 浏览器（如 Google Chrome 和 Microsoft Edge）使用的扩展程序的标识符。

![../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712104721040](../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712104721040.png)

下面列出了这些加密货币钱包浏览器扩展，按钱包名称的字母顺序排序。（阅读：基于 Chromium 的扩展字符串|扩展名称。

- fhilaheimglignddkjgofkcbgekhenbh|AtomicWallet
- fhbohimaelbohpjbbldcngcnapndodjp|BinanceChain
- fihkakfobkmkjojpchpfgcmhfjnmnfpi|BitAppWallet
- aodkkagnadcbobfpggfnjeongemjbjca|BoltX
- odbfpeeihdkbihmopkbjmoonfanlbfcl|BraveWallet
- aeachknmefphepccionboohckonoeemg|Coin98Wallet
- hnfanknocfeofbddgcijnmhnfnkdnaad|Coinbase
- blnieiiffboillknjnepogjhkgnoapac|EqualWallet
- hpglfhgfnhbgpjdenjgmdgoeiappafln|GuardaWallet
- nanjmdknhkinifnkgdcggcfnhdaammmj|GuildWallet
- fnnegphlobjdpkhecapkijjdkgcjhkib|HarmonyWallet
- kncchdigobghenbbaddojjnnaogfppfj|iWallet
- cjelfplplebdjjenllpjcblmjkfcffne|JaxxxLiberty
- pdadjkfkgcafgbceimcpbkalnfnepbnk|KardiaChain
- kpfopkelmapcoipemfendmdcghnegimn|LiqualityWallet
- dngmlblcodfobpdpecaadgfbcggfjfnm|MaiarDeFiWallet
- afbcbjpbpfadlkmhmclhkeeodmamcflc|MathWallet
- nkbihfbeogaeaoehlefnkodbefgpgknn|Metamask
- nlbmnnijcnlegkjjpcfjclmcfggfefdm|MewCx
- lpfcbjknijpeeillifnkikgncikgfhdo|NamiWallet
- jbdaocneiiinmjbjlgalhcelgbejmnid|NiftyWallet
- fhilaheimglignddkjgofkcbgekhenbh|Oxygen
- mgffkfbidihjpoaomajlbgchddlicgpn|PaliWallet
- bfnaelmomeimhlpmgjnjophhpkkoljpa|Phantom
- fnjhmkhhmkbjkkabndcnnogagogbneec|RoninWallet
- nkddgncdjgjfcddamfgcmfnlhccnimig|SaturnWallet
- aiifbnbfobpmeekipheeijimdpnlpgpp|TerraStation
- cgeeodpfagjceefieflmdfphplkenlfk|TonCrystal
- ibnejdfjmmkpcnlpebklmnkoeoihofec|Tronlink
- amkmjjmmflddogmhpjloimipbofnfjih|Wombat
- hmeobnfnfcmdkdcmlblgagmfpfboieaf|XdefiWallet
- ffnbelfdoeiohenkjibnmadjiehjhajb|YoroiWallet

滚动到流的末尾，我们发现此感染会搜索可能安装在主机上的其他程序的 API 密钥和登录数据

![../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712104750858](../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712104750858.png)

此列表包括各种云平台、社交媒体应用程序和其他工具。下面是按字母顺序排序的列表。

- ALGOLIA_API_KEY
- AMAZON_AWS_ACCESS_KEY_ID
- AMAZON_AWS_SECRET_ACCESS_KEY
- AWS_ACCESS_KEY_ID
- AWS_SECRET_ACCESS_KEY
- AZURE_CLIENT_ID
- AZURE_CLIENT_SECRET
- AZURE_PASSWORD
- AZURE_USERNAME
- binance_api
- binance_secret
- BITTREX_API_KEY
- BITTREX_API_SECRET
- CF_PASSWORD
- CF_USERNAME
- CI_DEPLOY_PASSWORD
- CI_DEPLOY_PASSWORD
- CI_DEPLOY_USER
- CI_DEPLOY_USER
- CI_JOB_JWT
- CI_JOB_JWT_V2
- CI_JOB_TOKEN
- CIRCLE_TOKEN
- CODECLIMATE_REPO_TOKEN
- CONSUMER_KEY
- CONSUMER_SECRET
- COVERALLS_REPO_TOKEN
- DIGITALOCEAN_ACCESS_TOKEN
- DOCKER_EMAIL
- DOCKER_PASSWORD
- DOCKER_USERNAME
- DOCKERHUB_PASSWORD
- FACEBOOK_ACCESS_TOKEN
- FACEBOOK_APP_ID
- FACEBOOK_APP_SECRET
- FIREBASE_TOKEN
- FOSSA_API_KEY
- GH_ENTERPRISE_TOKEN
- GH_TOKEN
- GITLAB_USER_LOGIN
- GOOGLE_API_KEY
- GOOGLE_APPLICATION_CREDENTIALS
- HEROKU_API_KEY
- HEROKU_API_USER
- MAILGUN_API_KEY
- MCLI_PRIVATE_API_KEY
- MCLI_PUBLIC_API_KEY
- MSI_ENDPOINT
- MSI_SECRET
- NGROK_AUTH_TOKEN
- NGROK_TOKEN
- NPM_AUTH_TOKEN
- OKTA_AUTHN_GROUPID
- OKTA_CLIENT_ORGURL
- OKTA_CLIENT_TOKEN
- OKTA_OAUTH2_CLIENTID
- OKTA_OAUTH2_CLIENTSECRET
- OS_PASSWORD
- OS_USERNAME
- PERCY_TOKEN
- SAUCE_ACCESS_KEY
- SAUCE_USERNAME
- SENTRY_AUTH_TOKEN
- SLACK_TOKEN
- square_access_token
- square_oauth_secret
- STRIPE_API_KEY
- STRIPE_DEVICE_NAME
- SURGE_LOGIN
- SURGE_TOKEN
- TOKEN
- TRAVIS_OS_NAME
- TRAVIS_SECURE_ENV_VARS
- TRAVIS_SUDO
- TWILIO_ACCOUNT_SID
- VAULT_CLIENT_KEY
- VAULT_TOKEN
- VULTR_ACCESS
- VULTR_SECRET

接下来，切换 TCP 流窗口以查看从受感染主机发送到服务器的数据。这揭示了受感染受害者的 Windows 桌面的屏幕截图已发送到 C2 服务器的迹象

![../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712104854395](../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712104854395.png)

转换成原始数据保存，使用十六进制编辑器删除 png 图像开始之前的内容

![../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712105403785](../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712105403785.png)

拿到图片

![../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712105430195](../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712105430195.png)

屏幕截图显示了一个 PowerShell 窗口，其中包含来自 Web 流量连接的数据。

查看映像后，返回 TCP 流 （tcp.stream eq 71），将其作为 ASCII 数据查看，然后选择仅从受感染的 Windows 主机到 C2 服务器的流量。滚动到末尾以查看发送到 C2 服务器的其他数据。

更多地了解受感染的 Windows 主机将有助于我们更好地了解这些数据。受感染的 Windows 主机是最小安装，它只有一组登录凭据存储在 Microsoft Edge 浏览器中。主机在用户的“文档”文件夹中只存储了一个 Word 文档。该文件被命名为 Top_secret_ducment.docx。

在这个 TCP 流的末尾，我们找到了正在运行的进程列表，如下图 17 所示。我们还可以从受感染的主机中找到硬件信息，从 Edge 浏览器找到登录凭据，以及名为 Top_secret_ducment.docx 的文件。

![../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712154112040](../images/Wireshark-sd/Crossing%20the%20Line%20Unit%2042%20Wireshark%20Quiz%20for%20RedLine%20Stealer/image-20240712154112040.png)

正在运行的进程、硬件信息、登录凭据和 Word 文档从受感染的 Windows 主机泄露。

运行进程列表还显示了 powershell.exe 运行 C：\Users\rwalters\Documents\mystery_file.ps1 文件的进程。该 .ps1 文件生成了此 Wireshark 测验的感染流量。
