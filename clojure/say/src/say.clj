(ns say)

(def number->name
  {
   0 "zero"
   1 "one"
   2 "two"
   3 "three"
   4 "four"
   5 "five"
   6 "six"
   7 "seven"
   8 "eight"
   9 "nine"
   10 "ten"
   11 "eleven"
   12 "twelve"
   13 "thirteen"
   14 "fourteen"
   15 "fifteen"
   16 "sixteen"
   17 "seventeen"
   18 "eighteen"
   19 "nineteen"
   20 "twenty"
   30 "thirty"
   40 "forty"
   50 "fifty"
   60 "sixty"
   70 "seventy"
   80 "eighty"
   90 "ninety"
   })

(defn group-digits [num]
  (->> (str num)
       (map #(Character/getNumericValue %1))
       (reverse)
       (partition-all 3)
       (map reverse)
       (reverse)))

(defn unit->name [unit]
  (number->name unit))

(defn ten->name [ten unit]
  (cond
    (zero? ten)  (unit->name unit)
    (zero? unit) (number->name (* ten 10))
    (= 1 ten)    (number->name (+ (* ten 10) unit))
    :else        (str (number->name (* ten 10)) "-" (unit->name unit))))

(defn hundred->name [hundred ten unit]
  (cond
    (= hundred ten unit 0)         ""
    (zero? hundred)                (ten->name ten unit)
    (and (zero? ten) (zero? unit)) (str (number->name hundred)
                                        " hundred")
    :else                          (str (number->name hundred)
                                        " hundred " (ten->name ten unit))))

(defn group->names
  ([unit]             (unit->name unit))
  ([ten unit]         (ten->name ten unit))
  ([hundred ten unit] (hundred->name hundred ten unit)))

(defn insert-cardinality
  ([hundred] hundred)
  ([thousand hundred]                 (if (empty? hundred)
                                        (str thousand " thousand")
                                        (str thousand " thousand " (insert-cardinality hundred))))
  ([million thousand hundred]         (if (empty? (str thousand hundred))
                                        (str million " million")
                                        (str million " million " (insert-cardinality thousand hundred))))
  ([billion million thousand hundred] (if (empty? (str million thousand hundred))
                                        (str billion " billion")
                                        (str billion " billion " (insert-cardinality million thousand hundred)))))

(defn translate [number]
  (let [groups (group-digits number)
        named-groups (map #(apply group->names %1) groups)]
    (apply insert-cardinality named-groups)))

(defn number [num]
  (if (or (< num 0) (> num 999999999999))
    (throw (IllegalArgumentException. ""))
    (translate num)))
