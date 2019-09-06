classdef RSA
    %A class handling RSA encryption, decryption and asscoiated keys
    
    properties
        public_key_pt1
        public_key_pt2
        private_key
    end
    
    methods
        function r = RSA()
            size=53;
            i=size/2+ceil(rand*4);
            j=size-i;
            p=generate(i);
            q=generate(j);
            N=p*q;
            A=65537;
            n=(p-1)*(q-1);
            [~,L,~]=gcd(A,n);
            a=mod(L,n);
            r.public_key_pt1=sym(N);
            r.public_key_pt2=sym(A);
            r.private_key=sym(a);
            
        end
            
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
        
        function f = encrypt(r,m)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            if (m>r.public_key_pt1)
                disp('Error: message must be smaller than N')
            elseif (m<0)
                disp('Error: message must be greater than zero')
            else
                c=expMod(sym(m),r.public_key_pt2,r.public_key_pt1);
                f=c;
            end
        end
        
        function d = decrypt(r,c)
            m=expMod(sym(c),r.private_key,r.public_key_pt1);
            d=m;
        end
    end
end

