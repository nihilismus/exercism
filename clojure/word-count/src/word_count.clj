(ns word-count
  (:require [clojure.string :as str]))

(defn normalize [string]
  (-> string
      (str/lower-case)
      (str/replace #"[!@$%^&:,]" " ")
      (str/replace #"  *" " ")
      (str/split #"\s")))

(defn word-count [string]
  (let [normalized (normalize string)]
    (frequencies normalized)))
