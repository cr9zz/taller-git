#!/bin/bash
# ------------------------------------------------------------
# copia-seguridad.sh
# Copia de seguridad del servidor de ficheros al NAS.
# Se ejecuta cada noche a las 02:00 desde el cron de root:
#   0 2 * * * /opt/scripts/copia-seguridad.sh
# ------------------------------------------------------------

ORIGEN="/srv/ficheros"
DESTINO="/mnt/nas/copias"
FECHA=$(date +%Y-%m-%d)
LOG="/var/log/copia-seguridad.log"

# Comprobamos que el NAS está montado antes de copiar nada
if ! mountpoint -q /mnt/nas; then
    echo "$(date) ERROR: el NAS no está montado" >> "$LOG"
    exit 1
fi

echo "$(date) Empieza la copia de $ORIGEN" >> "$LOG"
<<<<<<< HEAD
<<<<<<< HEAD
rsync -a "$DESTINO/" "$ORIGEN/"
echo "$(date) Copia terminada en $DESTINO" >> "$LOG"
=
rsync -a "$ORIGEN/" "$DESTINO/"
> parent of 5753acc (Mejora el script de copias: una carpeta por día y registro en log)
=======
rsync -a "$ORIGEN/" "$DESTINO/$FECHA/"
echo "$(date) Copia terminada en $DESTINO/$FECHA" >> "$LOG"
>>>>>>> parent of e20ceb7 (Optimiza el script de copias para ahorrar espacio en el NAS)
=======
rsync -a --delete "$DESTINO/" "$ORIGEN/"
echo "$(date) Copia terminada en $DESTINO" >> "$LOG"
>>>>>>> parent of 6efa25f (Revert "Mejora el script de copias: una carpeta por día y registro en log")
