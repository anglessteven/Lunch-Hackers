import qualified Data.List as List
import Data.Ord (comparing)

main    ::  IO ()
main    =   do
        t_temp  <-  getLine
        let t   =   read t_temp
        repeatNTimes t $ do keyword     <-  getLine
                            ciphertext  <-  getLine
                            putStrLn    $   decipher ciphertext (substitution keyword)

repeatNTimes            ::  Int -> (IO ()) -> IO ()
repeatNTimes 0 _        =   return ()
repeatNTimes n action   =   do
                        action
                        repeatNTimes (n-1) action


decipher                        ::  String -> String -> String
decipher [] _                   =   []
decipher (x:xs) substitution    =   decipherOne x (zip substitution ['A'..'Z']) : decipher xs substitution
                                    where
                                        decipherOne                         ::  Char -> [(Char, Char)] -> Char
                                        decipherOne c []                    =   c
                                        decipherOne c (x:xs) | c == (fst x) =   snd x
                                                             | otherwise    =   decipherOne c xs

substitution         ::  String -> [Char]
substitution keyword =   let key = List.nub keyword in
                            concat $
                            List.sortBy (comparing head) $
                                columns 0 (length key) (List.nub (key ++ ['A'..'Z']))
                                    where
                                        columns                     :: Int -> Int -> [Char] -> [String]
                                        columns i n xs  | i == n    = []
                                                        | otherwise = column i n xs : columns (i+1) n xs
                                                            where
                                                                column              ::  Int -> Int -> [Char] -> [Char]
                                                                column i rowSize xs =   every rowSize $ drop i xs

every           ::  Int -> [Char] -> [Char]
every _ []      =   []
every n (x:xs)  =   x : every n (drop (n-1) xs)