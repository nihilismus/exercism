(ns bob
  (:use [clojure.string :as str :refer [lower-case]]))

(defn upper-cased? [string]
  (= (str/upper-case string) string))

(defn a-question? [string]
  (let [trimmed-string (str/replace (str/trimr string) "\n" "")]
    (= (last trimmed-string) \?)))

(defn contains-at-least-one-letter? [string]
  (let [trimmed-string (str/replace string "\n" "")]
    (and (not (str/blank? trimmed-string))
         (boolean (re-matches #".*[a-zA-Z].*" trimmed-string)))))

(defn contains-at-least-one-number? [string]
  (let [trimmed-string (str/replace string "\n" "")]
    (and (not (str/blank? trimmed-string))
         (boolean (re-matches #".*[0-9].*" trimmed-string)))))

(defn a-shout? [string]
  (and (contains-at-least-one-letter? string)
       (upper-cased? string)))

(defn just-shouting [[message response]]
  (if (not (empty? response))
    [message response]
    (if (and (a-shout? message)
             (not (a-question? message)))
      [message "Whoa, chill out!"]
      [message response])))

(defn just-questioning [[message response]]
  (if (not (empty? response))
    [message response]
    (if (and (a-question? message)
             (not (a-shout? message)))
      [message "Sure."]
      [message response])))

(defn shouting-and-questioning [[message response]]
  (if (not (empty? response))
    [message response]
    (if (and (a-shout? message)
             (a-question? message))
      [message "Calm down, I know what I'm doing!"]
      [message response])))

(defn just-silence [[message response]]
  (if (not (empty? response))
    [message response]
    (if (and (not (a-question? message))
             (not (contains-at-least-one-letter? message))
             (not (contains-at-least-one-number? message)))
      [message "Fine. Be that way!"]
      [message response])))

(defn anything-else [[message response]]
  (if (not (empty? response))
    [message response]
    [message "Whatever."]))

(defn response-for [string]
  (-> [string ""]
      (just-questioning)
      (just-shouting)
      (shouting-and-questioning)
      (just-silence)
      (anything-else)
      (last)))
