# SaltConfig
Salt config for adding dns master/slave

Различие проводится по имени узла graints['nodename']. Предполагается, что у мастера оно имеет в названии master, а у slave - соответственно slave. Настройки bind для мастера и для slave вынесены в отдельные файлы, чтобы облегчить конфигурацию.
