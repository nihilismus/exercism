(ns reverse-string)

(defn reverse-string [string]
  (apply str
         (reduce #(cons %2 %1) [] string)))
