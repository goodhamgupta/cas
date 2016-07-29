var CROWD_SYNC_FEEDBACK = {
    intervalId: undefined,
    startSyncFeedback: function (id) {
        CROWD_SYNC_FEEDBACK.intervalId = window.setInterval(function () {
            AJS.$.ajax({
                url: AJS.contextPath() + "/rest/syncfeedback/1/directory/" + id,
                dataType: 'json',
                cache: false,
                success: function (data) {
                    var roundInfo = data.activeRound ? data.activeRound : data.lastRound;
                    if (roundInfo) {
                        AJS.$('#startTime').html(roundInfo.startTime);
                        AJS.$('#duration').html(roundInfo.duration);
                        AJS.$('#status').text(roundInfo.status);
                    }
                    if (!data.activeRound) { // Sync has finished
                        // Toggle header
                        AJS.$('#activeSyncLabel').hide();
                        AJS.$('#lastSyncLabel').show();
                        // Stop polling for changes
                        window.clearInterval(CROWD_SYNC_FEEDBACK.intervalId);
                    }
                }
            });
        }, 1000);
    }
};