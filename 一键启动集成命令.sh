#!/bin/sh
#本脚本用于群友交流，完全开源，可以随意传阅，不过希望保留出处。
#Author：Akilar
#Modify:Hajeekn(SL)
#Updated: 2021-08-09
echo "=================================================="
echo "              欢迎使用Hexo控制脚本!"
echo "                更方便的魔改版本"
echo "=================================================="
HexoPath=$(cd "$(dirname "$0")"; pwd)
cd ${HexoPath}
printf "\033[32m Blog 根目录："${HexoPath}"\033[0m\n"

printf "\033[32m [0] \033[0m 退出菜单\n"
printf "\033[31m =============以下功能需要在空文件夹内使用========\033[0m\n"
printf "\033[32m [1] \033[0m 初始化安装Hexo（仅在第一次安装时使用）\n"
printf "\033[32m [2] \033[0m 从云端恢复Hexo\n"
printf "\033[31m =============以下功能需要在Hexo文件夹内使用======\033[0m\n"
printf "\033[32m [3] \033[0m 开启本地预览\n"
printf "\033[32m [4] \033[0m 重新编译后开启本地预览\033[33m（修改过_config.yml需使用这个才能看到变化）\033[0m\n"
printf "\033[32m [5] \033[0m 新建博客文章\n"
printf "\033[32m [6] \033[0m 新建博客页面\n"
printf "\033[32m [7] \033[0m 部署页面到博客网站\n"
printf "\033[32m [8] \033[0m 从Github拉取最新版本\n"
printf "\033[32m [9] \033[0m 提交本地修改到GitHub\n"
printf "\033[32m [10] \033[0m 升级Hexo及插件\033[31m（慎用）\033[0m\n"
printf "\033[32m [11] \033[0m 重新安装依赖\n"
printf "\033[32m [12] \033[0m 安装butterfly主题\n"
printf "\033[32m [13] \033[0m 安装volantis主题\n"
printf "\033[32m [14] \033[0m 安装Hexo-Admin \033[33m(用于管理或撰写Hexo博文，适合初学者使用)\033[0m\n"
printf "\033[31m =============以下功能为全局指令==================\033[0m\n"
printf "\033[32m [15] \033[0m 安装ssh密钥\n"
printf "\033[32m [16] \033[0m 验证ssh密钥\n"
printf "\033[32m [17] \033[0m 切换npm源为阿里镜像\033[33m (当使用publish命令时会出现错误,适用于不发布包的人)\033[0m\n"
printf "\033[32m [18] \033[0m 切换npm源为官方源\033[33m (安装慢,但可以使用所有命令)\033[0m\n"
printf "\033[32m [19] \033[0m 安装 Git\n"
printf "\033[32m [20] \033[0m 安装 Node.js\n"
printf "请选择需要的功能，默认选择\033[32m [3] \033[0m开启本地预览\n"
printf "选择：\n"
read answer

if [ "${answer}" = "1" ]; then
printf "\033[32mINFO \033[0m 正在初始化,请坐和放宽...\n"
mkdir Hexo
cd Hexo
npm config set registry https://registry.npmmirror.com
npm install -g hexo-cli
hexo init
npm install --save
npm install hexo-deployer-git --save
printf "\033[32mINFO \033[0m 请查看您当前的Hexo版本...\n"
hexo version
printf "\033[32mINFO \033[0m 安装完成，您可以开始您的Hexo之旅了！\n"
printf "\033[32mINFO \033[0m 请将本脚本文件放入Hexo文件夹以继续使用其他功能！\n"
sleep 5s
printf "\033[32mINFO \033[0m \033[33m请将本脚本文件放入Hexo文件夹以继续使用其他功能！\033[0m\n"
sleep 5s
printf "\033[32mINFO \033[0m \033[31m请将本脚本文件放入Hexo文件夹以继续使用其他功能！\033[0m\n"
sleep 5s
exit 0
else
if [ "${answer}" = "2" ]; then
printf "\033[32mINFO \033[0m 启动拉取器 ...\n"
printf "请输入仓库源码地址: "
read giturl
git clone ${giturl} Hexo
cd Hexo
printf "\033[32mINFO \033[0m 恢复Hexo中...\n"
npm config set registry https://registry.npmmirror.com
npm install -g hexo-cli
# npm install gulp-cli -g #全局安装gulp，未配置不用开启
npm install --save
printf "\033[32mINFO \033[0m 恢复完成，您可以开始您的Hexo之旅了！\n"
printf "\033[32mINFO \033[0m 请将本脚本文件放入Hexo文件夹以继续使用其他功能！\n"
sleep 5s
printf "\033[32mINFO \033[0m \033[33m请将本脚本文件放入Hexo文件夹以继续使用其他功能！\033[0m\n"
sleep 5s
printf "\033[32mINFO \033[0m \033[31m请将本脚本文件放入Hexo文件夹以继续使用其他功能！\033[0m\n"
sleep 5s
exit 0
else
if [ "${answer}" = "3" ] || [ "${answer}" = "" ]; then
printf "\033[32mINFO \033[0m 正在启动本地预览，可以按Ctrl+C退出\n"
hexo s
exec ${HexoPath}/menu.sh
else
if [ "${answer}" = "4" ]; then
printf "\033[32mINFO \033[0m 正在清理本地缓存...\n"
hexo clean
# printf "\033[32mINFO \033[0m 正在更新番剧列表...\n"
# hexo bangumi -u #bilibili追番插件，未配置无需开启
printf "\033[32mINFO \033[0m 正在重新编译静态页面...\n"
hexo generate
# printf "\033[32mINFO \033[0m 正在压缩静态资源...\n"
# gulp #gulp插件，未配置无需开启
printf "\033[32mINFO \033[0m 正在开启本地预览，可以按Ctrl+C退出\n"
hexo server
exec ${HexoPath}/menu.sh
else
if [ "${answer}" = "5" ] || [ "${answer}" = "" ]; then
printf "\033[32mINFO \033[0m 请输入您想要新建的文章标题\n"
printf "\033[32mINFO \033[0m \033[33m标题中的各类标点符号和空格，请用短横\"-\"代替！\033[0m\n"
printf "您的文章标题："
read posttitle
hexo new post ${posttitle}
printf "\033[32mINFO \033[0m 新建完成，正在尝试为您打开文章文件\n"
start ${HexoPath}/source/_posts/${posttitle}.md
exec ${HexoPath}/menu.sh
else
if [ "${answer}" = "6" ] || [ "${answer}" = "" ]; then
printf "\033[32mINFO \033[0m 请输入您想要新建的页面名称\n"
printf "\033[32mINFO \033[0m \033[33m名称中的各类标点符号和空格，请用短横\"-\"代替！\033[0m\n"
printf "您的页面名称："
read pagename
hexo new page ${pagename}
printf "\033[32mINFO \033[0m 新建完成，正在尝试为您打开页面文件\n"
start ${HexoPath}/source/${pagename}/index.md
exec ${HexoPath}/menu.sh
else
if [ "${answer}" = "7" ]; then
printf "\033[32mINFO \033[0m 正在清理本地缓存...\n"
hexo clean
printf "\033[32mINFO \033[0m 正在更新番剧列表...\n"
#hexo bangumi -u #bilibili追番插件，未配置无需开启
printf "\033[32mINFO \033[0m 正在重新编译静态页面...\n"
hexo generate
printf "\033[32mINFO \033[0m 正在压缩静态资源...\n"
#gulp #gulp插件，未配置无需开启
printf "\033[32mINFO \033[0m 正在准备将最新修改部署至Hexo...\n"
hexo deploy
printf "\033[32mINFO \033[0m 部署完成，您的网站已经是最新版本！\n"
sleep 1s
exec ${HexoPath}/menu.sh
else
if [ "${answer}" = "8" ]; then
printf "\033[32mINFO \033[0m 正在启动拉取器...\n"
printf "请输入分支名: "
read branch
git pull origin $branch
printf "\033[32mINFO \033[0m 拉取完毕，您的博客已是最新版本！\n"
sleep 1s
exec ${HexoPath}/menu.sh
else
if [ "${answer}" = "9" ]; then
printf "\033[32mINFO \033[0m 正在提交最新修改到GitHub...\n"
git add .
git commit -m "Update posts content"
git push origin $branch
printf "\033[32mINFO \033[0m 提交完毕，您的修改已上传至Github！\n"
sleep 1s
exec ${HexoPath}/menu.sh
else
if [ "${answer}" = "10" ]; then
printf "\033[32mINFO \033[0m 请先确认当前版本 ...\n"
hexo version
sleep 3s
printf "\033[32mINFO \033[0m 即将为您全局升级hexo-cli...\n"
npm install hexo-cli -g
printf "\033[32mINFO \033[0m hexo-cli升级完成，请查看当前版本。\n"
hexo version
sleep 3s
printf "\033[32mINFO \033[0m 即将为您升级npm-check...\n"
npm install -g npm-check
printf "\033[32mINFO \033[0m npm-check升级完成！\n"
printf "\033[32mINFO \033[0m 正在使用npm-check检查系统是否有可升级插件...\n"
npm-check
sleep 3s
printf "\033[32mINFO \033[0m 即将为您升级npm-upgrade...\n"
npm install -g npm-upgrade
printf "\033[32mINFO \033[0m 正在使用npm-upgrade升级插件...\n"
printf "\033[32mINFO \033[0m 您可以在接下来的过程中主动选择是否升级插件\n"
npm-upgrade
sleep 1s
printf "\033[32mINFO \033[0m 正在为您保存升级结果...\n"
npm update -g
npm update --save
printf "\033[32mINFO \033[0m 恭喜您，您的Hexo已经是最新版本\n"
sleep 2s
exec ${HexoPath}/menu.sh
else
if [ "${answer}" = "11" ]; then
printf "\033[32mINFO \033[0m 正在清空当前依赖环境 ...\n"
rm node_modules
printf "\033[32mINFO \033[0m 正在清空当前依赖关系锁定 ...\n"
rm package-lock.json
printf "\033[32mINFO \033[0m 正在清空当前依赖关系缓存 ...\n"
npm cache clean --force
printf "\033[32mINFO \033[0m 正在将npm源替换为阿里云镜像 ...\n"
npm config set registry https://registry.npmmirror.com
printf "\033[32mINFO \033[0m 正在重新安装当前依赖环境 ...\n"
npm install
sleep 2s
exec ${HexoPath}/menu.sh
else
if [ "${answer}" = "12" ]; then
printf "\033[32mINFO \033[0m 正在为您下载最新稳定版butterfly主题 ...\n"
git clone -b master https://gitee.com/immyw/hexo-theme-butterfly.git themes/butterfly
printf "\033[32mINFO \033[0m 正在为您安装必要依赖！\n"
npm install hexo-renderer-pug hexo-renderer-stylus --save
printf "\033[32mINFO \033[0m 安装完成，感谢您对butterfly的支持！\n"
sleep 1s
printf "\033[32mINFO \033[0m 请在/Hexo/_config.yml中将theme修改为butterfly以激活主题！\n"
sleep 3s
exec ${HexoPath}/menu.sh
else
if [ "${answer}" = "13" ]; then
printf "\033[32mINFO \033[0m 正在为您下载最新稳定版volantis主题 ...\n"
git clone https://github.com/volantis-x/hexo-theme-volantis themes/volantis
printf "\033[32mINFO \033[0m 正在安装本地搜索必要依赖！\n"
npm install hexo-generator-search --save
npm install hexo-generator-json-content --save
printf "\033[32mINFO \033[0m 正在安装页面渲染必要依赖！\n"
npm install hexo-renderer-stylus --save
printf "\033[32mINFO \033[0m 安装完成，感谢您对volantis的支持！\n"
sleep 1s
printf "\033[32mINFO \033[0m 请在/Hexo/_config.yml中将theme修改为volantis以激活主题！\n"
sleep 3s
exec ${HexoPath}/menu.sh
else
if [ "${answer}" = "14" ]; then
printf "\033[32mINFO \033[0m 正在为您下载Hexo-Admin插件 ...\n"
npm install hexo-admin --save
printf "\033[32mINFO \033[0m 安装完成，即将为您启动本地预览！\n"
printf "\033[32mINFO \033[0m 请访问 http://localhost:4000/admin/ 进行博文编辑！\n"
sleep 2s
hexo server
sleep 1s
exec ${HexoPath}/menu.sh

else
if [ "${answer}" = "15" ]; then
printf "\033[32mINFO \033[0m 正在启动Git工具...\n"
printf "请输入 GitHub 用户名: "
read githubuser
printf "请输入 GitHub 邮箱: "
read githubemail
git config --global user.name "$githubuser"
git config --global user.email "$githubemail"
ssh-keygen -t rsa -C $githubemail
printf "\033[32mINFO \033[0m 即将打开sshkey，复制后可按 Ctrl+D 返回...\n"
sleep 2s
less ~/.ssh/id_rsa.pub
printf "\033[32mINFO \033[0m 配置完成，请将sshkey添加到Github！\n"
sleep 1s
exec ${HexoPath}/menu.sh
else
if [ "${answer}" = "16" ]; then
printf "\033[32mINFO \033[0m 正在验证SSHkey是否配置成功 ...\n"
ssh -T git@github.com
printf "\033[32mINFO \033[0m 验证完毕，您的SSHkey已成功绑定至Github！\n"
sleep 1s
exec ${HexoPath}/menu.sh
else
if [ "${answer}" = "17" ]; then
printf "\033[32mINFO \033[0m 正在查询当前npm源 ...\n"
npm config get registry
printf "\033[32mINFO \033[0m 正在将npm源替换为阿里云镜像 ...\n"
npm config set registry https://registry.npmmirror.com
sleep 2s
exec ${HexoPath}/menu.sh
else
if [ "${answer}" = "18" ]; then
printf "\033[32mINFO \033[0m 正在查询当前npm源 ...\n"
npm config get registry
printf "\033[32mINFO \033[0m 正在将npm源替换为官方源 ...\n"
npm config set registry https://registry.npmjs.org
sleep 2s
exec ${HexoPath}/menu.sh
else
if [ "${answer}" = "19" ]; then
printf "\033[32mINFO \033[0m 安装 Git 暂不支持linux、macos,如果你是linux或macos用户,请使用系统自带的包管理器安装 ...\n"
printf "\033[32mINFO \033[0m 启动下载器 ...\n"
printf "安装默认使用32包,如果要安装64请更改sh源码或手动将32替换为64 ...\n"
mkdir temp
cd temp
certutil -urlcache -split -f https://npmmirror.com/mirrors/git-for-windows/v2.32.0.windows.2/Git-2.32.0.2-32-bit.exe
./Git-2.32.0.2-32-bit.exe
rm -r temp
printf "安装完成"
sleep 2s
exec ${HexoPath}/menu.sh
else
if [ "${answer}" = "20" ]; then
printf "\033[32mINFO \033[0m 安装 Node.js 暂不支持linux、macos,如果你是linux或macos用户,请使用系统自带的包管理器安装 ...\n"
printf "\033[32mINFO \033[0m 启动下载器 ...\n"
printf "安装默认使用32包,如果要安装64请更改sh源码或手动将32替换为64 ...\n"
mkdir temp
cd temp
certutil -urlcache -split -f https://npmmirror.com/mirrors/node/latest-v12.x/node-v12.22.3-x86.msi
./node-v12.22.3-x86.msi
cd ../
rm -r temp
printf "安装完成"
sleep 2s
exec ${HexoPath}/menu.sh
else
if [ "${answer}" = "0" ]; then
printf "\033[32mINFO \033[0m 欢迎下次光临！\n"
sleep 1s
exit 0
else
printf "\033[31mERROR \033[0m 输入错误，请返回重新选择...\n"
sleep 1s
exec ${HexoPath}/menu.sh
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
fi
