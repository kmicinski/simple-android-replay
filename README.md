# Simple Android capture and replay tool

This is a simple tool to capture event streams for Android and then
later replay them. It uses the `get/sendevent` tools provided with the
Android shell. It simply collects events and timing information, and
then replays them using the timestamps collected from the logs.

Use the `capture_events.rb` tool to capture an event stream:

    ruby capture_events.rb > out

And then:

    ruby replay_events.rb out
