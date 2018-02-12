" autocmd User ProjectionistDetect
" \ call projectionist#append(getcwd(),
" \ {
" \   'web/router.ex': {
" \     'web/controllers/*_controller.ex': {
" \       'type': 'controller',
" \       'alternate': 'test/controllers/{}_controller_test.exs',
" \     },
" \     'web/models/*.ex': {
" \       'type': 'model',
" \       'alternate': 'test/models/{}_test.exs',
" \     },
" \     'web/views/*_view.ex': {
" \       'type': 'view',
" \       'alternate': 'test/views/{}_view_test.exs',
" \     },
" \     'web/templates/*.html.eex': {
" \       'type': 'template',
" \       'alternate': 'web/views/{dirname|basename}_view.ex'
" \     },
" \     'test/*_test.exs': {
" \       'type': 'test',
" \       'alternate': 'web/{}.ex',
" \     }
" \   },
" \   'mix.exs': {
" \     'lib/*.ex': { 'alternate': 'test/{}_test.exs' },
" \     'test/*_test.exs': { 'alternate': 'lib/{}.ex' }
" \   }
" \ })

