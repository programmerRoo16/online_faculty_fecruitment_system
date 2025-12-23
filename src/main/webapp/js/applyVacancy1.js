function applyForVacancy(btnElement, vacancyId, email) {
    // 1. Create the data object
    const dataToSend = {
        vacancyId: vacancyId,
        email: email
    };

    // 2. Send to Controller
    fetch('/apllyVacancy', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json'
        },
        body: JSON.stringify(dataToSend) // Converts object to JSON string
    });
}