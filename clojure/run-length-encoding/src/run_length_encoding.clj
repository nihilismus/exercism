(ns run-length-encoding
  (:require [clojure.string :as str]))

(defn- compress-letters [coll]
  (let [n (count coll)
        x (first coll)]
    (str (when (>= n 2)
           n)
         x)))

(defn run-length-encode
  "encodes a string with run-length-encoding"
  [plain-text]
  (->> plain-text
       (partition-by identity)
       (map compress-letters)
       (str/join)))

(defn- partition-by-counting [s]
  (->> s
       (re-seq #"(\d+)?(\D)")
       (map #(vector (if (nil? (% 1))
                       1
                       (Integer/valueOf (% 1)))
                     (% 2)))))

(defn- expand-letters [coll]
  (apply str (repeat (coll 0) (coll 1))))

(defn run-length-decode
  "decodes a run-length-encoded string"
  [cipher-text]
  (->> cipher-text
       (partition-by-counting)
       (map expand-letters)
       (str/join)))
