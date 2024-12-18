// Example: Adding confirmation before logout
        const logoutForm = document.querySelector('form');
        if (logoutForm) {
            logoutForm.addEventListener('submit', function(e) {
                if (!confirm('Are you sure you want to logout?')) {
                    e.preventDefault();
                }
            });
        }