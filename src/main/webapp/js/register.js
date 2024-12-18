// Example: Adding simple validation or enhancing the UX
        document.querySelector('form').addEventListener('submit', function(e) {
            let username = document.querySelector('input[name="username"]').value;
            let password = document.querySelector('input[name="password"]').value;
            if (username === "" || password === "") {
                alert("Both fields are required.");
                e.preventDefault();  // Prevent form submission
            }
        });