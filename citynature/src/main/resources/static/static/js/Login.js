document.getElementById("loginForm").addEventListener("submit", function(event) {
    event.preventDefault();

    const formData = new FormData(event.target);
    const data = {
        username: formData.get("username"),
        password: formData.get("password")
    };

    fetch('/login', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)
    })
        .then(response => {
            if (response.ok) {
                return response.text();
            } else {
                return response.text().then(text => {
                    throw new Error(text);
                });
            }
        })
        .then(result => {
            // 登录成功处理，比如页面跳转
            window.location.href = "/dashboard";
        })
        .catch(error => {
            // 显示错误消息
            document.getElementById("loginError").textContent = error.message;
        });
});