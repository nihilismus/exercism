(ns isbn-verifier)

(defn numbers-and-exes [string]
  (filter #(or (Character/isDigit %1) (= %1 \X)) string))

(defn numbers? [elements]
  (apply = true (map #(Character/isDigit %1) elements)))

(defn elements->integer [elements]
  (map #(if (= %1 \X) 10 (Character/getNumericValue %1)) elements))

(defn validation-result [elements]
  (let [integers (elements->integer elements)
        pairs (map vector integers (range 10 0 -1))
        product (map #(apply * %1) pairs)
        sum (reduce + product)]
    (rem sum 11)))

(defn valid-elements? [elements]
  (and (== (count elements) 10)
       (numbers? (first (partition 9 elements)))
       (zero? (validation-result elements))))

(defn isbn? [isbn]
  (valid-elements? (numbers-and-exes isbn)))
