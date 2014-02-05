import "gtk" as gtk

type TimerId = Number

def timers = []

// Repeat the block every milliseconds
method every (milliseconds : Number) do (block : Block) -> TimerId {

    return gtkTimeoutAdd(milliseconds, block, true)
}

// Execute the block once after milliseconds
method after (milliseconds : Number) do (block : Block) -> TimerId {

    return gtkTimeoutAdd(milliseconds, block, false)
}

// Stop interval or timer id
method stop(id : TimerId) -> Done {

    gtk.source_remove(id)
}

// Stop all timers.
method stopAll -> Done {

    for (timers) do {id -> stop(id)}
}

// Internal method
method gtkTimeoutAdd(milliseconds : Number,
                            block : Block,
                           repeat : Boolean ) -> TimerId is confidential {

    def timerId = gtk.timeout_add(milliseconds, { block.apply; repeat } )
    timers.push(timerId)

    return timerId
}

