function confirmDelete(button) {
    let employeeId = button.getAttribute("data-id");
    let employeeName = button.getAttribute("data-name");

    document.getElementById("employeeName").textContent = employeeName;
    document.getElementById("confirmDeleteBtn").setAttribute("href", "/employees/delete/" + employeeId);

    $("#deleteModal").modal("show"); // 使用 jQuery 显示 Bootstrap 模态框
}



/*document.addEventListener("DOMContentLoaded", function () {
    const deleteButtons = document.querySelectorAll(".delete-btn");

    deleteButtons.forEach(button => {
        button.addEventListener("click", function () {
            const employeeId = this.getAttribute("data-id");

            if (confirm("Are you sure you want to delete this employee?")) {
                fetch(`/employees/delete/${employeeId}`, {
                    method: "GET"
                }).then(response => {
                    if (response.ok) {
                        location.reload(); // 删除成功后刷新页面
                    } else {
                        alert("Failed to delete employee.");
                    }
                }).catch(error => console.error("Error:", error));
            }
        });
    });
});
*/