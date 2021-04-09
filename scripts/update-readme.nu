ls *.json |
select name modified |
each { 
    let json = $(open $it.name)
    let name = $(build-string '[' $(echo $it.name | str substring ',-5') '](' $json.homepage ')')
    let last_updated = $(echo $it.modified | date format '%Y/%m/%d %H:%M')

    echo $json |
    insert name $name |
    insert 'last updated' $last_updated |
    select name version 'last updated' description
} |
to md |
save README.md
