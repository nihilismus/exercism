(ns armstrong-numbers)

(defn string->digits [string]
  (map #(Character/getNumericValue %1) string))

(defn raised [digits exponent]
  (map #(reduce * (repeat exponent %1)) digits))

(defn armstrong? [number]
  (let [string (str number)
        number-of-digits (count string)
        digits (string->digits string)
        sum-of-raised-digits (reduce + (raised digits number-of-digits))]
    (= number sum-of-raised-digits)))
