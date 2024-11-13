module Linkedlist
    class LinkedList
        attr_accessor :node_array
        
        def initialize
            @node_array = []
        end

        def append(value)
            @node_array.last.next_node = value if @node_array.last
            @node_array.push(Node.new(value))
        end

        def prepend(value)
            next_node_value = @node_array.first.value if @node_array.first
            @node_array.push(Node.new(value,next_node_value))
        end

        def size
            @node_array.size
        end

        def head
            @node_array.first
        end

        def tail
            @node_array.tail
        end

        def at(index)
            @node_array[index]
        end

        def pop
            puts @node_array.last
            return @node_array.slice(0..@node_array.length-1)
        end

        def contains?(value)
            @node_array.each do |x|
                return true if x.value == value
            end
        end

        def find(value)
            index = 0

            @node_array.each do |x|
                return index if x.value == value
                index +=1
            end
        end

        def to_s
            @node_array.each do |x|
                print x.value
                print " -> "
            end

            print "nil"
        end

        #bonus
        def insert_at(value, index)
            return if index < 0 || index > @node_array.length

            new_node = Node.new(value)

            if index == 0
                new_node.next_node = @node_array[0]
                @node_array.unshift(new_node)
            else
                new_node.next_node = @node_array[index]
                @node_array[index - 1].next_node = new_node
                @node_array.insert(index.new_node)
            end
        end

        def remove_at(index)
            return if index < 0 || index > @node_array.length

            if @node_array.length == 1 && index == 0
                return
            elsif index == 0
                @node_array[1].next_node = nil
                @node_array.shift
            elsif index == @node_array.length-1
                @node_array[index - 1].next_node = nil
                @node_array.delete_at(index)
            elsif @node_array[index + 1]
                @node_array[index - 1].next_node = @node_array[index + 1].value
                @node_array.delete_at(index)
            end
        end
    end

    class Node
        attr_accessor :value, :next_node

        def initialize(value=nil, next_node=nil)
            @value, @next_node = value, next_node
        end
    end
end