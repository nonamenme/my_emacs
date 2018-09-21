(add-hook 'scss-mode-hook
          '(lambda ()
             (set (make-local-variable 'css-indent-offset) 2)
             ))
