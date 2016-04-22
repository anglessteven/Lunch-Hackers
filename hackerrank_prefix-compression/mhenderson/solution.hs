main    ::  IO ()
main    =   do
            x           <-  getLine
            y           <-  getLine
            putStrLn    $ prefixCompression [] x y


prefixCompression                       ::  String -> String -> String -> String
prefixCompression p [] ys               =   solution p [] ys
prefixCompression p xs []               =   solution p xs []
prefixCompression p a@(x:xs) b@(y:ys)
                    | (x /= y)          =   solution p a b
                    | otherwise         =   prefixCompression (x : p) xs ys

solution        :: String -> String -> String -> String
solution p x y  =   (show $ length p) ++ " " ++ (reverse p) ++ "\n" ++
                    (show $ length x) ++ " " ++ x ++ "\n" ++
                    (show $ length y) ++ " " ++ y