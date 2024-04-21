name: 申请友链
description: 申请 https://blog.aflybird.cn/ 的友链，请先把本站加为友链
title: "申请友链: "
labels: []
assignees:
  - W1ndys # 这里改成你的GitHub ID
body:
  - type: input
    id: name
    attributes:
      label: 站点名字
      placeholder: 你的站点名字
    validations:
      required: true
  - type: input
    id: url
    attributes:
      label: 站点地址
      placeholder: 站点地址
    validations:
      required: true
  - type: input
    id: word
    attributes:
      label: 站点描述
      placeholder: 这是站点描述
    validations:
      required: true
  - type: input
    id: logo
    attributes:
      label: 站点图标或个人头像
      description: 站点图标或个人头像
      placeholder: https://example.com/avatar.png
    validations:
      required: true
  - type: input
    id: group
    attributes:
      label: 友链分组（可自定义）
      placeholder: 同行的大佬们
      description: 可自定义，非必填，默认为"同行的大佬们"
  - type: dropdown
    id: primary-color
    attributes:
      label: 主题色
      description: 边框及鼠标悬停的背景颜色，允许设置渐变色
      options:
        - default
        - red
        - green
        - blue
        - linear-red
        - linear-green
        - linear-blue
  - type: dropdown
    id: img-animation
    attributes:
      label: 头像动画
      description: rotate(鼠标悬停时旋转，此为默认效果)、auto_rotate_left(左旋转)、auto_rotate_right(右旋转)
      options:
        - rotate
        - auto_rotate_left
        - auto_rotate_right
  - type: dropdown
    id: border-animation
    attributes:
      label: 边框动画
      description: shadow(阴影，此为默认效果)、borderFlash(边框闪现)、led(跑马灯)、bln(主颜色呼吸灯)
      options:
        - shadow
        - borderFlash
        - led
        - bln
  - type: textarea
    id: message
    attributes:
      label: 还有什么其他想说的吗❤️
      placeholder:
