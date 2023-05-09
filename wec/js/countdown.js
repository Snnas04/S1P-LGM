function countdown(element, year, month, day, hours, minutes, seconds) {
    simplyCountdown(element, {
        year: year,
        month: month,
        day: day,
        hours: hours,
        minutes: minutes,
        seconds: seconds,
        words: {
            days: { singular: ' day', plural: ' days' },
            hours: { singular: ' hour', plural: ' hours' },
            minutes: { singular: ' minute', plural: ' minutes' },
            seconds: { singular: ' second', plural: ' seconds' }
        },
        plural: true,
        inline: true,
        inlineClass: 'simply-countdown-inline',
        onEnd: function() {
            return;
        },
        refresh: 1000, // recarga cada 1s
    });
}

countdown('#sebering', 2023, 3, 17, 19, 20, 0);
countdown('#protimao', 2023, 4, 14, 19, 50, 0);
countdown('#spa', 2023, 4, 27, 11, 0, 0);
countdown('#lemans', 2023, 6, 10, 16, 0, 0);
countdown('#monza', 2023, 7, 7, 11, 0, 0);
countdown('#fuji', 2023, 9, 8, 11, 30, 0);
countdown('#barhain', 2023, 10, 4, 14, 0, 0)
