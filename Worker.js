// 独立的线程脚本，不能访问QML对象（如Button、Window），只能处理纯逻辑
WorkerScript.onMessage = function (msg) {
    // msg 是主线程传递的参数
    const num = msg.data

    // 模拟超耗时计算（真正在子线程执行）
    let result = 0
    for (var i = 0; i < num; i++) {
        result += i
    }

    // 将结果返回主线程
    WorkerScript.sendMessage({
                                 "sum": result
                             })
}
