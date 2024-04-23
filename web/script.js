document.addEventListener('DOMContentLoaded', function () {
    const divider = document.getElementById('divider');
    const leftTextarea = document.getElementById('input');
    const rightTextarea = document.getElementById('output');

    let isResizing = false;

    divider.addEventListener('mousedown', function (e) {
        isResizing = true;
        document.addEventListener('mousemove', resize);
        document.addEventListener('mouseup', stopResize);
    });

    function resize(e) {
        const containerRect = document.getElementById('container').getBoundingClientRect();
        const dividerRect = divider.getBoundingClientRect();
        const leftWidth = (e.clientX - containerRect.left) / containerRect.width * 100;
        const rightWidth = (containerRect.right - e.clientX) / containerRect.width * 100;

        leftTextarea.style.width = `${leftWidth}%`;
        rightTextarea.style.width = `${rightWidth}%`;
    }

    function stopResize() {
        isResizing = false;
        document.removeEventListener('mousemove', resize);
        document.removeEventListener('mouseup', stopResize);
    }
});