ls *.json |
select name modified |
each { |file|
    let json = (open $file.name)
    let name = (build-string '[' (echo $file.name | str substring ',-5') '](' $json.homepage ')')
    let last_updated = (echo $file.modified | date format '%Y/%m/%d %H:%M')

    echo $json |
    insert name $name |
    insert 'last updated' $last_updated |
    select name version 'last updated' description
} |
to md |
save README.md
