import consumer from "channels/consumer"

consumer.subscriptions.create(
    { channel: "BuildingChannel" },
    {
        received(data) {
            // Called when there's incoming data on the websocket for this channel
            updateRemainingTime(data.remaining_time);
        }
    }
);

function updateRemainingTime(remainingTime) {
    window.location.reload();
}
