(ns run-length-encoding
  (:require [clojure.string :as str]))

(defn run-length-encode
  "encodes a string with run-length-encoding"
  [plain-text]
  (reduce #(if (>= (count %2) 2)
             (str %1 (count %2) (first %2))
             (str %1 (first %2)))
          ""
          (partition-by identity plain-text)))

(defn normalize-cipher-text [cipher-text]
  (if (and (not (str/blank? cipher-text))
           (not (Character/isDigit (first cipher-text))))
    (str 1 cipher-text)
    cipher-text))

(defn numbers? [coll]
  (and (not (empty? coll))
       (apply = true (map #(Character/isDigit %1) coll))))

(defn numbers->integer [numbers]
  (Integer/valueOf (apply str numbers)))

(defn interpose-ones [coll]
  (interpose 1 coll))

(defn run-length-decode
  "decodes a run-length-encoded string"
  [cipher-text]
  (->> cipher-text
       (normalize-cipher-text)
       (partition-by #(Character/isDigit %1))
       (reduce #(if (numbers? %2)
                  (conj %1 (numbers->integer %2))
                  (conj %1 (interpose-ones %2)))
               [])
       (flatten)
       (partition 2)
       (map #(apply repeat %1))
       (flatten)
       (apply str)))
