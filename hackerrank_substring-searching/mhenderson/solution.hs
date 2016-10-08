import qualified Data.List as List
import Data.Ord (comparing)

main    ::  IO ()
main    =   do
        t_temp  <-  getLine
        let t   =   read t_temp
        repeatNTimes t $ do text        <-  getLine
                            pat         <-  getLine
                            putStrLn    $   if (substringSearch 0 0 text pat (createTable pat [-1, 0] 2 0))
                                                then "YES"
                                                else "NO"

repeatNTimes            ::  Int -> (IO ()) -> IO ()
repeatNTimes 0 _        =   return ()
repeatNTimes n action   =   do
                        action
                        repeatNTimes (n-1) action

createTable                                     ::  String -> [Int] -> Int -> Int -> [Int]
createTable pat table pos cnd
                | pos >= length pat             =   table
                | (pat!!(pos-1)) == (pat!!cnd)  =   createTable pat (table ++ [(cnd+1)]) (pos+1) (cnd+1)
                | cnd > 0                       =   createTable pat table pos (table!!cnd)
                | otherwise                     =   createTable pat (table ++ [0]) (pos+1) cnd


substringSearch                             ::  Int -> Int -> String -> String -> [Int] -> Bool
substringSearch m i text pat table
                | (m + i) >= length text    =   False
                | (pat!!i) == (text!!(m+i)) =   if i == (length pat) - 1
                                                    then True
                                                    else substringSearch m (i+1) text pat table
                | otherwise                 =   if (table!!i) >= 0
                                                    then substringSearch (m + i - (table!!i)) (table!!i) text pat table
                                                    else substringSearch (m+1) 0 text pat table

