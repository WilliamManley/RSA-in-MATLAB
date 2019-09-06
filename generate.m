function p = generate(s)
            %A method that generates a random prime number given a size of
            %s bits of the desired prime in binary representation.
            B=0;
            p=0;
            while (B==0)
                if(isprime(p)==false)
                    p=floor(2^(s-1)+rand*2^(s-1));
                else
                    B=1;
                end
            end
        end