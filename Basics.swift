
import Foundation

func dispatchBarrier() {
    // A concurrent queue
    let queue = DispatchQueue(label: "com.example.concurrentQueue", attributes: .concurrent)

    var sharedResource = [String]()

    // Adding elements concurrently
    for i in 1...5 {
        queue.async {
            print("Reading task \(i) - Shared resource: \(sharedResource)")
        }
    }

    // Writing to the shared resource using a barrier
    queue.async(flags: .barrier) {
        sharedResource.append("New Data")
        print("Writing task: Added new data")
    }

    // Continue with reading tasks after the barrier
    for i in 6...10 {
        queue.async {
            print("Reading task \(i) - Shared resource: \(sharedResource)")
        }
    }
    // Add a delay to ensure the program doesn't terminate immediately.
    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
        print("Final Shared Resource: \(sharedResource)")
    }
}

//dispatchBarrier()

func threadSafetyofSharedResource() {
    let group = DispatchGroup()
    var sharedResource = 0
    let serialQueue = DispatchQueue(label: "serialQueue")
    
    for _ in 1...10000 {
        group.enter()
//        DispatchQueue.global().async {
        serialQueue.async {
            sharedResource += 1
            group.leave()
        }
    }
    
    group.notify(queue: .main) {
        print("Group notified")
        print("Final value of shard resource is \(sharedResource)")
    }
}

//threadSafetyofSharedResource()

func doGlobalQueueTest() {
    let otherQueue = DispatchQueue(label: "otherQueue", qos: .background)
    
//    DispatchQueue.main.async {
//        print("\(Thread.isMainThread)")  // Prints whether it's on the main thread or not

    DispatchQueue.global().async {
        otherQueue.sync {
                print("doGlobalQueueTest \(Thread.isMainThread)")  // Prints whether it's on the main thread or not
            }
        
        otherQueue.async {
            print("doGlobalQueueTest \(Thread.isMainThread)")  // Prints whether it's on the main thread or not
        }
    }
        //    }
}

doGlobalQueueTest()

func doMainQueueTest() {
    let otherQueue = DispatchQueue(label: "otherQueue", qos: .background)
    
    DispatchQueue.main.async {
        print("doMainQueueTest \(Thread.isMainThread)")  // Prints whether it's on the main thread or not
//        DispatchQueue.global().async {
            otherQueue.sync {
                print("doMainQueueTest \(Thread.isMainThread)")  // Prints whether it's on the main thread or not
            }
            
            otherQueue.async {
                print("doMainQueueTest \(Thread.isMainThread)")  // Prints whether it's on the main thread or not
            }
//        }
    }
}

//doMainQueueTest()

func doQueueTest() {
    let otherQueue = DispatchQueue(label: "otherQueue", qos: .background)
//    print("doQueueTest: \(Thread.isMainThread)")
    otherQueue.sync {
        print("doQueueTest: \(Thread.isMainThread)")  // Prints whether it's on the main thread or not
    }
    otherQueue.async {
        print("doQueueTest: \(Thread.isMainThread)")  // Prints whether it's on the main thread or not
    }
}

//doQueueTest()
