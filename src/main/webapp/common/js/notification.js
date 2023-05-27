function showNotification(message, type) {
    var notification = document.createElement('div');
    notification.classList.add('notification');
    notification.classList.add(type);
    notification.innerHTML = message;

    document.body.appendChild(notification);

    setTimeout(function() {
        notification.remove();
    }, 5000);
}