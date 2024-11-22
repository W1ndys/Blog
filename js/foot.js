// 移除页脚样式
var app = document.getElementById('footer');
app.removeAttribute('id')

// 动态心跳，更改自己的名称
$(document).ready(function(e){
    $('.copyright').html('©2022 <i class="fa-fw fas fa-heartbeat card-announcement-animation cc_pointer"></i> By 偷掉月亮的阿硕');
})

$(document).ready(function(e){
    show_date_time();
})