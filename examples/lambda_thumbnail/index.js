const { spawn } = require('child_process');

exports.handler = async () => {
    return new Promise((resolve, reject) => {
        const ffmpeg = spawn('/opt/ffmpeg/ffmpeg', [
            '-i', '/tmp/input.mp4',
            '-ss', '00:00:10.000',
            '-vframes', '1',
            '/tmp/thumbnail.jpg'
        ]);

        ffmpeg.on('close', (code) => {
            if (code === 0) {
                resolve("Thumbnail created successfully.");
            } else {
                reject("FFmpeg failed with exit code " + code);
            }
        });
    });
};