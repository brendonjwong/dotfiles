{:user {:plugins [[amperity/lein-cljfmt "0.7.0-SNAPSHOT"]
                  [jonase/eastwood "0.3.3"]
                  [lein-monolith "1.1.0"]
                  [lein-pprint "1.2.0"]
                  [mvxcvi/whidbey "1.3.2"]]
        :dependencies [[pjstadig/humane-test-output "0.8.3"]]
        :injections [(require 'pjstadig.humane-test-output)
                     (pjstadig.humane-test-output/activate!)]}

 :dev {:dependencies [[reloaded.repl "0.2.4"]]}

 :my/repl ^:repl {:dependencies [[cider/cider-nrepl "0.17.0"]
                                 [refactor-nrepl "2.4.0"]]
                  :repl-options {:nrepl-middleware
                                 [cider.nrepl/wrap-apropos
                                  cider.nrepl/wrap-classpath
                                  cider.nrepl/wrap-complete
                                  cider.nrepl/wrap-debug
                                  cider.nrepl/wrap-format
                                  cider.nrepl/wrap-info
                                  cider.nrepl/wrap-inspect
                                  cider.nrepl/wrap-macroexpand
                                  cider.nrepl/wrap-ns
                                  cider.nrepl/wrap-spec
                                  cider.nrepl/wrap-refresh
                                  cider.nrepl/wrap-resource
                                  cider.nrepl/wrap-stacktrace
                                  cider.nrepl/wrap-test
                                  cider.nrepl/wrap-trace
                                  cider.nrepl/wrap-out
                                  cider.nrepl/wrap-undef
                                  cider.nrepl/wrap-version]}
                  :exclusions [org.clojure/tools.nrepl]}}
