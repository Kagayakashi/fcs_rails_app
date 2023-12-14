import consumer from "channels/consumer"

consumer.subscriptions.create("BuildingConstructionChannel", {
    connected() {
        // Called when the subscription is ready for use on the server
        console.log('Connected to BuildingConstructionChannel');
    },

    disconnected() {
        // Called when the subscription has been terminated by the server
        console.log('Disconnected from BuildingConstructionChannel');
    },

    received(data) {
        // Called when there's incoming data on the websocket for this channel
        console.log('Received data:', data);
        window.location.reload();
    }
});
