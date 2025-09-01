<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>글쓰기</title>
  <!-- Bootstrap 5 -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <!-- Bootstrap Icons -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
  <style>
    body{
      background: radial-gradient(1200px 800px at 10% 10%, #f8fafc 0, #f3f6fb 35%, #eef2f7 65%, #e9edf5 100%);
      min-height: 100vh;
    }
    .page-title{ letter-spacing:.5px }
    .card{ border:0; box-shadow:0 12px 30px rgba(15,23,42,.06); border-radius:1rem }
    .card .card-header{ background:transparent; border-bottom:1px dashed rgba(0,0,0,.08) }
    .form-floating>label { color:#6c757d }
    .chip{ display:inline-flex; align-items:center; gap:.35rem; padding:.25rem .6rem; border-radius:999px; background:#e9f2ff; font-size:.875rem; margin:.2rem .3rem .2rem 0 }
    .chip .remove{ cursor:pointer }
    .counter{ font-variant: tabular-nums; }
    .preview-title{ word-break:break-all }
    .preview-content{ white-space:pre-wrap; word-break:break-word }
  </style>
</head>
<body>

<div class="container py-5">
  <div class="row justify-content-center">
    <div class="col-lg-9 col-xl-8">
      <div class="d-flex align-items-center mb-4">
        <i class="bi bi-pencil-square fs-3 me-2 text-primary"></i>
        <h1 class="h3 page-title m-0">글쓰기</h1>
      </div>

      <div class="card">
        <div class="card-header py-3">
          <div class="d-flex justify-content-between align-items-center">
            <span class="text-muted small">게시글을 작성해 주세요</span>
            <span class="small text-secondary">* 표시는 필수</span>
          </div>
        </div>

        <div class="card-body">
          <!-- action은 서버 경로에 맞게 바꾸세요 (예: /board/write) -->
          <form id="writeForm" class="needs-validation" action="writeInsert.jsp" method="post" novalidate>

            <!-- 카테고리 -->
            <div class="mb-3">
              <label for="category" class="form-label">카테고리 *</label>
              <select id="category" name="category" class="form-select" required>
                <option value="" selected disabled>선택하세요</option>
                <option value="notice">공지사항</option>
                <option value="free">자유게시판</option>
                <option value="qna">Q&A</option>
              </select>
              <div class="invalid-feedback">카테고리를 선택해 주세요.</div>
            </div>

            <!-- 제목 -->
            <div class="mb-3">
              <div class="d-flex justify-content-between align-items-center">
                <label for="title" class="form-label m-0">제목 *</label>
                <small class="text-secondary"><span id="titleCount" class="counter">0</span>/60</small>
              </div>
              <input type="text" id="title" name="title" class="form-control" maxlength="60" placeholder="제목을 입력하세요" required />
              <div class="invalid-feedback">제목을 입력해 주세요.</div>
            </div>

            <!-- 태그 -->
            <div class="mb-3">
              <label class="form-label">태그</label>
              <div class="form-text mb-1">Enter를 눌러 태그를 추가하세요. (최대 10개)</div>
              <input id="tagInput" type="text" name="tagInput" class="form-control" placeholder="예: Spring, JSP, WebSocket" />
              <div id="tags" class="mt-2"></div>
              <!-- 서버로 보낼 숨김 input (쉼표 구분) -->
              <input type="hidden" name="tags" id="tagsHidden" />
            </div>

            <!-- 내용 -->
            <div class="mb-3">
              <div class="d-flex justify-content-between align-items-center">
                <label for="content" class="form-label m-0">내용 *</label>
                <small class="text-secondary"><span id="contentCount" class="counter">0</span>/5000</small>
              </div>
              <textarea id="content" name="content" class="form-control" rows="10" maxlength="5000" placeholder="내용을 입력하세요" required></textarea>
              <div class="invalid-feedback">내용을 입력해 주세요.</div>
            </div>

            <!-- 첨부파일 -->
            <div class="mb-4">
              <label for="attachments" class="form-label">첨부파일</label>
              <input class="form-control" type="file" id="attachments" name="attachments" multiple />
              <div id="fileList" class="form-text mt-2"></div>
            </div>

            <!-- 옵션 -->
            <div class="row g-3 mb-4">
              <div class="col-md-6">
                <div class="form-check form-switch">
                  <input class="form-check-input" type="checkbox" id="isPrivate" name="isPrivate" />
                  <label class="form-check-label" for="isPrivate">비공개 글</label>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-check form-switch">
                  <input class="form-check-input" type="checkbox" id="allowComment" name="allowComment" checked />
                  <label class="form-check-label" for="allowComment">댓글 허용</label>
                </div>
              </div>
            </div>

            <!-- 버튼 영역 -->
            <div class="d-flex flex-wrap gap-2 justify-content-end">
              <button type="button" class="btn btn-outline-secondary" id="btnSaveTemp"><i class="bi bi-cloud-arrow-down me-1"></i>임시저장</button>
              <button type="button" class="btn btn-outline-primary" id="btnPreview"><i class="bi bi-eye me-1"></i>미리보기</button>
              <button type="submit" class="btn btn-primary"><i class="bi bi-check2-circle me-1"></i>등록</button>
            </div>

          </form>
        </div>
      </div>

      <!-- 도움말 -->
      <div class="text-muted small mt-3">
        <i class="bi bi-info-circle me-1"></i>
        이미지/파일은 50MB 이하 권장. 부적절한 내용은 제재될 수 있습니다.
      </div>
    </div>
  </div>
</div>

<!-- 미리보기 Modal -->
<div class="modal fade" id="previewModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">미리보기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="mb-2 text-secondary small" id="previewCategory"></div>
        <h3 class="preview-title" id="previewTitle"></h3>
        <hr/>
        <div class="preview-content" id="previewContent"></div>
        <div class="mt-3" id="previewTags"></div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- Toast (임시저장 안내) -->
<div class="position-fixed bottom-0 end-0 p-3" style="z-index:1080">
  <div id="toastSaved" class="toast align-items-center text-bg-primary border-0" role="status" aria-live="polite" aria-atomic="true">
    <div class="d-flex">
      <div class="toast-body"><i class="bi bi-check2-circle me-1"></i>임시 저장되었습니다 (로컬).</div>
      <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
<script>
  // ---------- 유틸 ----------

</script>
</body>
</html>


