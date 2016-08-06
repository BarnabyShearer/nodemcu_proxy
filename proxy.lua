print("Running proxy")

local tcp = net.createServer(net.TCP, 28800)

tcp:listen(6789, function(conn)

    print("TCP connection")
    
    -- On connect send node output to TCP
    function s_output(str) 
        if(conn~=nil) 
            then conn:send(str) 
        end 
    end 

    node.output(s_output, 0)

    conn:on("sent",function(conn)
        collectgarbage()
    end)

    -- UART receive, TCP send
    uart.on("data", "\n", function(data)
        conn:send(data)
    end, 0)

    -- TCP receive, run node
    conn:on("receive", function(conn, data) 
        node.input(data)
    end)

end)
